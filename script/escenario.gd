extends Node2D
 
var esqueleto = preload("res://enemigos/enemigo.tscn")
var fantasma = preload("res://enemigos/enemigo1.tscn")
var random =  RandomNumberGenerator.new()
@onready var player_position = $Marker2D
var personaje = load(global.player)
#var personaje = load("res://player-max/player.tscn")
#var level_bounds = Rect2(0, 0, 990, 680)

func _ready():
	$Timer.start()
	if personaje:
		var personaje_insta = personaje.instantiate()
		personaje_insta.global_position = player_position.global_position
		add_child(personaje_insta)

var leve = global.leve
func _on_timer_timeout():
	
	if leve == "nivel1":
		var enemigo_ins = fantasma.instantiate()
		enemigo_ins.position = Vector2(random.randi_range(100,800),random.randi_range(100,500))
		add_child(enemigo_ins)
	elif leve == "nivel2":
		var enemigo_ins = esqueleto.instantiate()
		enemigo_ins.position = Vector2(random.randi_range(100,800),random.randi_range(100,500))
		add_child(enemigo_ins)
