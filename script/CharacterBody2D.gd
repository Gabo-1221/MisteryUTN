extends CharacterBody2D

const VELOCIDAD = 100.0
@onready var player1 = $".."
@onready var animacion = $AnimatedSprite2D

func _physics_process(delta):
	if Input.is_action_pressed("abajo"):
		player1.position.y += VELOCIDAD * delta 
		animacion.play("Abajo")
	elif Input.is_action_pressed("arriba"):
		player1.position.y -= VELOCIDAD * delta 
		animacion.play("Arriba")
	elif Input.is_action_pressed("derecha"):
		player1.position.x += VELOCIDAD * delta 
		animacion.play("Derecha")
	elif Input.is_action_pressed("izquierda"):
		player1.position.x -= VELOCIDAD * delta 
		animacion.play("Izquierda")
	else:
		animacion.stop()
	move_and_slide()
