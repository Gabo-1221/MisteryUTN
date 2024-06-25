extends Node2D

var enemigo = preload("res://enemigos/enemigo.tscn")
var random =  RandomNumberGenerator.new()
func _ready():
	$Timer.start()
	

func _on_timer_timeout():
	var enemigo_ins = enemigo.instantiate()
	enemigo_ins.position = Vector2(random.randi_range(100,800),random.randi_range(100,500))
	add_child(enemigo_ins)
