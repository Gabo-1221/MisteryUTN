extends Area2D
var spped = 300

func _ready():
	set_as_top_level(true)

func _process(delta):
	position += (Vector2.RIGHT*spped).rotated(rotation) * delta

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
	 # Replace with function body.