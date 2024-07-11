extends CanvasLayer

@onready var title = $PanelContainer/MarginContainer/Rows/Title
@onready var button = $PanelContainer/MarginContainer/Rows/CenterContainer/VBoxContainer/ActionButton
var leve = global.leve
var verde = Color(0,255,0,255)
var rojo = Color(255,0,0,255)


func set_title(win = false):
	if win:
		title.text = "GANASTE"
		title.modulate = Color.GREEN
	if !win:
		title.text = "PERDISTE"
		title.modulate = Color.RED


func _on_salir_button_pressed():
	get_tree().quit()


func _on_action_button_pressed():
	global.leve = "nivel1"
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Escenarios/menu_inicio.tscn")
	
