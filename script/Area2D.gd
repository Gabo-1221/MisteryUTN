extends Area2D

@onready var enemigo = load("res://enemigos/enemigo.tscn")

var bool_spwan = true
var random =  RandomNumberGenerator.new()

func _ready():
	random.randomize()
	
func _process(delta):
	spwan()
	
func spwan():
	if bool_spwan:
		$Timer_enemy.start()
		bool_spwan = false
		var enemigo_instance = enemigo.instantiate()
		enemigo_instance.position = Vector2(random.randi_range(100,800),random.randi_range(100,500))
		add_child(enemigo_instance)

func _on_timer_enemy_timeout():
	bool_spwan = true
