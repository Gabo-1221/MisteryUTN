extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cooldowm = true
var health = 180
var player_alive = true

var attack_ip = false

const VELOCIDAD = 110
var current_dir = "none"

var mochila = true
var enfriar_lanzar = true
var lapiz = preload("res://materiales/lapiz.tscn")

func _ready():
	$AnimatedSprite2D.play("mantener_arriba")

func _physics_process(_delta):
	player_movement(_delta)
	enemy_attack()
	attack()
	
	if health <= 0:
		player_alive = false #ir de regreso al menu or repond
		health = 0 
		print("jugador estado muerto")
		self.queue_free()

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
		#print("player toco enemigo")
		health = health - 10
		enemy_attack_cooldowm = false
		$Attack_timer.start()
		print(health)


func _on_attack_timer_timeout():
	enemy_attack_cooldowm = true
	

func attack():
	var dir = current_dir
	if Input. is_action_just_pressed("ataque"):
		print("ataque")
		global.player_current_attack  = true
		attack_ip =  true
		if dir == "derecha":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("mantener_derecha")
			$deal_attack_timer.start()
		if dir == "izquierda":
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("mantener_izquierda")
			$deal_attack_timer.start()
		if dir == "arriba":
			$AnimatedSprite2D.play("mantener_arriba")
			$deal_attack_timer.start()
		if dir == "abajo":
			$AnimatedSprite2D.play("mantener_abajo")
			$deal_attack_timer.start()

func _on_deal_attack_timer_timeout():
	$deal_attack_timer.stop()
	global.player_current_attack = false
	attack_ip = false
