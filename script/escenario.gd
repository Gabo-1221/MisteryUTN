extends Node2D

var enemigo = preload("res://enemigos/enemigo.tscn")
var random =  RandomNumberGenerator.new()
@onready var player_position = $Marker2D
var personaje = load(global.player)
#var level_bounds = Rect2(0, 0, 990, 680)

func _ready():
	$Timer.start()
	if personaje:
		var personaje_insta = personaje.instantiate()
		personaje_insta.global_position = player_position.global_position
		add_child(personaje_insta)
		
		var camera = personaje_insta.get_node("Camera2D")
		#camera.current = true  # Asegurar que la cámara del personaje sea la activa
		#camera.limit_left = level_bounds.position.x
		#camera.limit_top = level_bounds.position.y
		#camera.limit_right = level_bounds.position.x + level_bounds.size.x
		#camera.limit_bottom = level_bounds.position.y + level_bounds.size.y
		#camera.limit_left = level_bounds.position.x * 4
		#camera.limit_top = level_bounds.position.y * 4
		#camera.limit_right = (level_bounds.position.x + level_bounds.size.x) * 4
		#camera.limit_bottom = (level_bounds.position.y + level_bounds.size.y) * 4
		#camera.zoom = Vector2(4, 4)  # Establecer el zoom de la cámara a 4x4
	

func _on_timer_timeout():
	var enemigo_ins = enemigo.instantiate()
	enemigo_ins.position = Vector2(random.randi_range(100,800),random.randi_range(100,500))
	add_child(enemigo_ins)
