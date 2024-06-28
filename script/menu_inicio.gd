extends Control

var player1 = "res://player-max/player.tscn"
var player2 = "res://player_sam/player_sam.tscn"
var player3 = "res://player_steve/steve_player.tscn"

func _ready():
	$personaje1/max.play("mantener")
	$personaje2/sam.play("mantener")
	#$personaje3/steve.play("mantener")
	

func _on_personaje_1_pressed():
	global.player = player1
	get_tree().change_scene_to_file("res://escenario.tscn")

func _on_personaje_2_pressed():
	global.player = player2
	get_tree().change_scene_to_file("res://escenario.tscn")

#func _on_personaje_3_pressed():
	#get_tree().change_scene_to_file("res://escenario.tscn")
