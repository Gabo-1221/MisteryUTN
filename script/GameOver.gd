extends CanvasLayer

const MENU = "res://Escenarios/menu_inicio.tscn"

func set_title():
	$VBoxContainer/Label.text = global.game

func _on_button_button_down():
	get_tree().change_scene_to_file(MENU)
