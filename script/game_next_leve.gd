extends CanvasLayer


func _on_action_button_pressed():
	global.leve = "nivel2"
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Escenarios/nivel_2.tscn")


func _on_salir_button_pressed():
	get_tree().quit()
