extends Node2D

const SCENE_FINISH_FILE ="res://materiales/game_over.tscn"
signal time_update(second_left)
@export var time_second = 4
#@onready var controlgame = "res://materiales/game_over.tscn"
const CON_GAME = preload("res://materiales/GameOverScreen.tscn")



func winner():
	var game_over = CON_GAME.instantiate()
	add_child(game_over)
	game_over.set_title(true)
	get_tree().paused = true

func loser():
	var game_over = CON_GAME.instantiate()
	add_child(game_over)
	game_over.set_title(false)
	get_tree().paused = true

func _on_timesobrev_timeout():
	if time_second > 0:
		time_second = time_second - 1
	if time_second <= 0:
		winner()
	time_update.emit(time_second)
