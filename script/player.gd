extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cooldowm = true
var things_attack_pos = false
var health = 100
var player_alive = true

var attack_ip = false

var VELOCIDAD = 80
var current_dir = "none"
var next_leve : String = "res://Escenarios/menu_inicio.tscn"
var mochila = true
var enfriar_lanzar = true
var lapiz = preload("res://materiales/lapiz.tscn")
@onready var label = $reloj_crono
const CON_GAME = preload("res://materiales/GameOverScreen.tscn")

func _ready():
	$AnimatedSprite2D.play("mantener_arriba")
	

func _physics_process(_delta):
	player_movement(_delta)
	enemy_attack()
	#attack()
	update_health()
	
	if health <= 0:
		player_alive = false #ir de regreso al menu or repond
		health = 0 
		label.visible = false
		self.queue_free()
		game_over()
		

func game_over():
	#var game = CON_GAME.instantiate()
	#get_tree().root.add_child(game)
	#game.set_title(false)
	get_tree().change_scene_to_file("res://materiales/GameOverScreen.tscn")
	#call_deferred("_pause_tree")

func _pause_tree():
	# Pausar el árbol de la escena
	get_tree().paused = true

func player_movement(_delta):
	if Input.is_action_pressed("derecha"):
		current_dir = "derecha"
		play_anim(1)
		velocity.x = VELOCIDAD
		velocity.y = 0
	elif Input.is_action_pressed("izquierda"):
		current_dir = "lado_izquierdo"
		play_anim(1)
		velocity.x = -VELOCIDAD
		velocity.y = 0
	elif Input.is_action_pressed("abajo"):
		current_dir = "abajo"
		play_anim(1)
		velocity.y = VELOCIDAD
		velocity.x = 0
	elif Input.is_action_pressed("arriba"):
		current_dir = "arriba"
		play_anim(1)
		velocity.y = -VELOCIDAD
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
	lanzar_lapiz()

func lanzar_lapiz():
	var mouse_pos = get_global_mouse_position()
	$Marker2D.look_at(mouse_pos)
	
	if Input.is_action_just_pressed("left_mouse") and enfriar_lanzar:
		enfriar_lanzar = false
		var lapiz_instance = lapiz.instantiate()
		lapiz_instance.rotation = $Marker2D.rotation
		lapiz_instance.global_position = $Marker2D.global_position
		add_child(lapiz_instance)
		
		await get_tree().create_timer(0.2).timeout
		enfriar_lanzar = true

func play_anim(movimiento):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "derecha":
		anim.flip_h = false
		if movimiento == 1:
			anim.play("Derecha")
		elif movimiento == 0:
			if attack_ip == false:
				anim.play("mantener_derecha")
	if dir == "lado_izquierdo":
		anim.flip_h = false
		if movimiento == 1:
			anim.play("lado_izquierdo")
		elif movimiento == 0:
			if attack_ip == false:
				anim.play("mantener_izquierda")
	if dir == "abajo":
		anim.flip_h = true
		if movimiento == 1:
			anim.play("Abajo")
		elif movimiento == 0:
			if attack_ip == false:
				anim.play("mantener_abajo")
	if dir == "arriba":
		anim.flip_h = true
		if movimiento == 1:
			anim.play("Arriba")
		elif movimiento == 0:
			if attack_ip == false:
				anim.play("mantener_arriba")

func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemigo"):
		enemy_inattack_range = true

func _on_player_hitbox_body_exited(body):
	if body.has_method("enemigo"):
		enemy_inattack_range = false

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldowm == true:
		health = health - 10
		enemy_attack_cooldowm = false
		$Attack_timer.start()

func lentitud():
	VELOCIDAD = 25
	health = health - 5
	$lentitud.start(10)


func _on_attack_timer_timeout():
	enemy_attack_cooldowm = true
	
#prieba de ataque cercano
#func attack():
	#var dir = current_dir
	#if Input. is_action_just_pressed("ataque"):
		#global.player_current_attack  = true
		#attack_ip =  true
		#if dir == "derecha":
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("mantener_derecha")
			#$deal_attack_timer.start()
		#if dir == "izquierda":
			#$AnimatedSprite2D.flip_h = true
			#$AnimatedSprite2D.play("mantener_izquierda")
			#$deal_attack_timer.start()
		#if dir == "arriba":
			#$AnimatedSprite2D.play("mantener_arriba")
			#$deal_attack_timer.start()
		#if dir == "abajo":
			#$AnimatedSprite2D.play("mantener_abajo")
			#$deal_attack_timer.start()

func _on_deal_attack_timer_timeout():
	$deal_attack_timer.stop()
	global.player_current_attack = false
	attack_ip = false

func update_health():
	var healthbar = $healthBar
	healthbar.value = health 
	
	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true

func _on_regin_timer_timeout():
	if health < 100:
		health = health + 20
		if health > 100:
			health = 100
	if health <= 0:
		health = 0

func _on_lentitud_timeout():
	VELOCIDAD = 80

func _on_area_2d_area_entered(area):
	if area.has_method("touch_posima"):
		lentitud()
		area.queue_free() 


#prieba de cambio
#var leve = global.leve
#func chance_escene(nueva_escena): 
	#var leve = global.leve
	#var time = global.time_person
	#global.save_datos(leve, health, time)
	#get_tree().change_scene_to_file("res://Escenarios/laboratorio.tscn")
