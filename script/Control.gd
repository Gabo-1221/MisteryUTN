extends Node2D

@onready var game_controller = $"../gameController"
@onready var time_label: Label = $Label
@onready var timer: Timer = $Timer

var start_hour = 22 
var end_hour = 6    
var current_hour = 22 
var current_minute = 0 

func _ready():
	timer.wait_time = 1
	timer.connect("timeout",Callable(self,"_on_Timer_timeout"))
	timer.start()
	_update_time_label()

func _on_Timer_timeout():
	current_hour +=1
	
	if current_hour >= 24:
		current_hour = 0
	if current_hour == end_hour:
		timer.stop()
		game_controller.game_win()
		
	_update_time_label()

func _update_time_label():
	var hour_str = str(current_hour).pad_zeros(2)
	var minute_str = str(current_minute).pad_zeros(2)
	time_label.text = hour_str + ":" + minute_str
	
#func _ready():
	#rest_timer()
#
#var seconds = 0
#var minutes = 0
#var Dseconds = 30
#var Dminutes = 1
#
#func rest_timer():
	#seconds = Dseconds
	#minutes = Dminutes
#
#func _on_timer_timeout():
	#if seconds == 0:
		#if minutes >0:
			#minutes -=1
			#seconds =60
	#seconds -=1
	#$Label.text = str(minutes)+":"+str(seconds)
#
