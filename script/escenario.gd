extends Node2D

var enemigo = preload("res://enemigos/enemigo.tscn")
var random =  RandomNumberGenerator.new()
@onready var player_position = $Marker2D
var personaje = load(global.player)

func _ready():
	$Timer.start()
	var personaje_insta = personaje.instantiate()
	personaje_insta.global_position = player_position.global_position
	add_child(personaje_insta)
	

func _on_timer_timeout():
	var enemigo_ins = enemigo.instantiate()
	enemigo_ins.position = Vector2(random.randi_range(100,800),random.randi_range(100,500))
	add_child(enemigo_ins)
