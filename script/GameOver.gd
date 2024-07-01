extends CanvasLayer

@onready var title = $PanelContainer/MarginContainer/Rows/Title

func set_title(win: bool):
	if win:
		title.text = "GANASTE"
		title.modulate = Color.GREEN
	else:
		title.text = "PERDISTE"
		title.modulate = Color.RED

func _on_resetart_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Escenarios/menu_inicio.tscn")


func _on_salir_button_pressed():
	get_tree().quit()
