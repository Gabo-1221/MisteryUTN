extends CanvasLayer

@onready var time_label: Label = $Label
@onready var timer: Timer = $Timer

var start_hour = 22 
var end_hour = 6    
var current_hour = 22 
var current_minute = 0 
var player = global.player
var leve = global.leve
const CON_GAME = preload("res://materiales/GameOverScreen.tscn")
@onready var label = $Label
func _ready():
	timer.wait_time = 10
	timer.connect("timeout",Callable(self,"_on_Timer_timeout"))
	timer.start()
	_update_time_label()

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
	
func _on_Timer_timeout():
	current_hour +=1
	
	if current_hour >= 24:
		current_hour = 0
	if current_hour == end_hour:
		timer.stop()
		label.visible = false
		if leve == "nivel1":
			get_tree().change_scene_to_file("res://menu/game_next_leve.tscn")
		if leve == "nivel2":
			winner() 
	_update_time_label()


func _update_time_label():
	var hour_str = str(current_hour).pad_zeros(2)
	var minute_str = str(current_minute).pad_zeros(2)
	time_label.text = hour_str + ":" + minute_str
