extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cooldowm = true
var health = 180
var player_alive = true

var attack_ip = false

const VELOCIDAD = 200
var current_dir = "none"


func _ready():
	$AnimatedSprite2D.play("mantener")

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
	if Input.is_action_just_pressed("derecha"):
		current_dir = "derecha"
		play_anim(1)
		velocity.x = VELOCIDAD
		velocity.y = 0
	elif Input.is_action_just_pressed("izquierda"):
		current_dir = "izquierda"
		play_anim(1)
		velocity.x = -VELOCIDAD
		velocity.y = 0
	elif Input.is_action_just_pressed("abajo"):
		current_dir = "abajo"
		play_anim(1)
		velocity.y = VELOCIDAD
		velocity.x = 0
	elif Input.is_action_just_pressed("arriba"):
		current_dir = "arriba"
		play_anim(1)
		velocity.y = -VELOCIDAD
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func play_anim(movimiento):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "derecha":
		anim.flip_h = false
		if movimiento == 1:
			anim.play("Derecha")
		elif movimiento == 0:
			if attack_ip == false:
				anim.play("mantener")
	if dir == "izquierda":
		anim.flip_h = true
		if movimiento == 1:
			anim.play("Izquierda")
		elif movimiento == 0:
			if attack_ip == false:
				anim.play("mantener")
	if dir == "arriba":
		anim.flip_h = true
		if movimiento == 1:
			anim.play("Arriba")
		elif movimiento == 0:
			if attack_ip == false:
				anim.play("mantener")
	if dir == "abajo":
		anim.flip_h = true
		if movimiento == 1:
			anim.play("Abajo")
		elif movimiento == 0:
			if attack_ip == false:
				anim.play("mantener")

func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true


func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldowm == true:
		health = health - 20
		enemy_attack_cooldowm = false
		$Attack_timer.start()
		print(health)


func _on_attack_timer_timeout():
	enemy_attack_cooldowm = true
	
func attack():
	var dir = current_dir
	if Input.is_action_just_pressed("ataque"):
		global.player_current_attack  = true
		attack_ip =  true
		if dir == "derecha":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("Abajo")
			$deal_attack_timer.start()
		if dir == "izquierda":
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("Abajo")
			$deal_attack_timer.start()
		if dir == "abajo":
			$AnimatedSprite2D.play("Arriba")
			$deal_attack_timer.start()
		if dir == "abajo":
			$AnimatedSprite2D.play("Arriba")
			$deal_attack_timer.start()

func _on_deal_attack_timer_timeout():
	$deal_attack_timer.stop()
	global.player_current_attack = false
	attack_ip = false
