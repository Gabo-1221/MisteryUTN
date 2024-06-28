extends Node2D

const SCENE_FINISH_FILE ="res://materiales/game_over.tscn"
signal time_update(second_left)
@export var time_second = 4
#@onready var controlgame = "res://materiales/game_over.tscn"
func game_over():
	global.game = "GAME OVER"
	get_tree().change_scene_to_file(SCENE_FINISH_FILE)
	
func game_win():
	global.game = "Has Sobrevivido"
	get_tree().change_scene_to_file(SCENE_FINISH_FILE)

func _on_timesobrev_timeout():
	if time_second > 0:
		time_second = time_second - 1
	if time_second <= 0:
		game_over()
	time_update.emit(time_second)
