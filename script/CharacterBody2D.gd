extends CharacterBody2D

const VELOCIDAD = 100
var current_dir = "none"

func _ready():
	$AnimatedSprite2D.play()

func _physics_process(_delta):
	player_movement(_delta)

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
	move_and_slide()

func play_anim(movimiento):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "derecha":
		anim.flip_h = false
		if movimiento == 1:
			anim.play("Derecha")
	if dir == "izquierda":
		anim.flip_h = false
		if movimiento == 1:
			anim.play("Izquierda")
	if dir == "arriba":
		anim.flip_h = false
		if movimiento == 1:
			anim.play("Arriba")
	if dir == "abajo":
		anim.flip_h = false
		if movimiento == 1:
			anim.play("Abajo")
#@onready var player1 = $".."
#@onready var animacion = $AnimatedSprite2D
#
#func _physics_process(delta):
	#if Input.is_action_pressed("abajo"):
		#player1.position.y += VELOCIDAD * delta 
		#animacion.play("Abajo")
	#elif Input.is_action_pressed("arriba"):
		#player1.position.y -= VELOCIDAD * delta 
		#animacion.play("Arriba")
	#elif Input.is_action_pressed("derecha"):
		#player1.position.x += VELOCIDAD * delta 
		#animacion.play("Derecha")
	#elif Input.is_action_pressed("izquierda"):
		#player1.position.x -= VELOCIDAD * delta 
		#animacion.play("Izquierda")
	#else:
		#animacion.stop()
	#move_and_slide()
