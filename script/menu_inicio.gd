extends Control

var player1 = "res://player-max/player.tscn"
var player2 = "res://player_sam/player_sam.tscn"
var player3 = "res://player_steve/steve_player.tscn"

func _ready():
	$personaje1/max.play("mantener")
	$personaje2/sam.play("mantener")
	$personaje3/steve.play("mantener")

func _process(_delta):
	apa_playerDesc()

func _on_personaje_1_pressed():
	global.player = player1
	global.leve = "nivel1"
	get_tree().change_scene_to_file("res://escenario.tscn")

func _on_personaje_2_pressed():
	global.player = player2
	global.leve = "nivel1"
	get_tree().change_scene_to_file("res://escenario.tscn")

func _on_personaje_3_pressed():
	global.player = player3
	global.leve = "nivel1"
	get_tree().change_scene_to_file("res://escenario.tscn")


func apa_playerDesc():
	if Input.is_action_pressed("buttonSecret1") and Input.is_action_pressed("buttonSecret2") and Input.is_action_pressed("buttonSecrect3"):
		$personaje3.visible = true

