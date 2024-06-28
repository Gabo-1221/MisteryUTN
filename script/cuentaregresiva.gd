extends CanvasLayer


func _on_game_controller_time_update(second_left):
	$TextureRect/Label.text = str(second_left)

