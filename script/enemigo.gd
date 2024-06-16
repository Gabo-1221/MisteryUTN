extends CharacterBody2D


const SPEED:int = 60
var player = null
var move = Vector2.ZERO

func _physics_process(delta):
	move = Vector2.ZERO

	if player != null:
		move = position.direction_to(player.position)
		print("no")
	else:
		move = Vector2.ZERO
	move = move.normalized() * SPEED
	print("si")
	move = move_and_collide(move)
	
	
func _on_area_2d_body_entered(body):
	if body != self:
		player = body

func _on_area_2d_body_exited(body):
	player = null

