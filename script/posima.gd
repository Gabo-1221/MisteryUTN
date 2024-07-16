extends Area2D
var vel = 100

func _ready():
	set_as_top_level(true)

func _process(delta):
	position += (Vector2.RIGHT*vel).rotated(rotation) * delta

func touch_posima():
	pass

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
