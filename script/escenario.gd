extends Node2D
 
var esqueleto = preload("res://enemigos/enemigo.tscn")
var fantasma = preload("res://enemigos/enemigo1.tscn")
var bruja = preload("res://enemigos/bruja.tscn")
var random =  RandomNumberGenerator.new()
@onready var player_position = $Marker2D
var personaje = load(global.player)


func _ready():
	$Timer.start()
	$spwan_bruja.start()
	if personaje:
		var personaje_insta = personaje.instantiate()
		personaje_insta.global_position = player_position.global_position
		add_child(personaje_insta)

var leve = global.leve

var posicion_esc_estacion = [
	Vector2(random.randi_range(45,980),random.randi_range(170,374)),
	Vector2(random.randi_range(380,800),random.randi_range(200,320)),
	Vector2(random.randi_range(920,970),random.randi_range(385,645)),
	Vector2(random.randi_range(418,440),random.randi_range(400,630)),
	Vector2(random.randi_range(323,337),random.randi_range(588,610))
]

var posicion_esc_piscina = [
	Vector2(random.randi_range(30,220),random.randi_range(30,610)),
	Vector2(random.randi_range(260,570),random.randi_range(30,240)),
	Vector2(random.randi_range(615,960),random.randi_range(115,245)),
	Vector2(random.randi_range(855,930),random.randi_range(280,480)),
	Vector2(random.randi_range(250,930),random.randi_range(500,620))
]

func _on_timer_timeout():
	if leve == "nivel1":
		var enemigo_ins = fantasma.instantiate()
		enemigo_ins.position = posicion_esc_estacion[randi_range(0,4)]
		add_child(enemigo_ins)
	elif leve == "nivel2":
		var enemigo_ins = esqueleto.instantiate()
		enemigo_ins.position = posicion_esc_piscina[randi_range(0,4)]
		add_child(enemigo_ins)


func _on_spwan_bruja_timeout():
	if leve == "nivel1":
		var bruja_inst = bruja.instantiate()
		bruja_inst.position = posicion_esc_estacion[randi_range(0,4)]
		add_child(bruja_inst)
	elif leve == "nivel2":
		var bruja_inst = bruja.instantiate()
		bruja_inst.position = posicion_esc_piscina[randi_range(0,4)]
		add_child(bruja_inst)



func _on_audio_stream_player_2d_finished():
	pass # Replace with function body.
