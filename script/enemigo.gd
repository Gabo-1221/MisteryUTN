extends  CharacterBody2D

var speed = 20
var player_chase = false
var player = null

var dead = false
var health = 100
var player_inattack_zone = false
var can_take_damage =  true

func _physics_process(_delta):
	#deal_with_damage()
	if !dead:
		$Area2D/CollisionShape2D.disabled = false
		if player_chase:
			position += (player.position - position)/speed
			$AnimatedSprite2D.play("Abajo")
			if(player.position.x - position.x) < 0:
				$AnimatedSprite2D.flip_h = true
			else:
				$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.play("Abajo")
	if dead:
		$Area2D/CollisionShape2D.disabled = true

func _on_Detection_area_body_entered(body):
	if body.has_method("player"):
		player_chase = true
		player = body

func _on_Detection_area_body_exited(body):
	if body.has_method("player"):
		player_chase = false

func enemigo():
	pass
  

func take_damage(damage):
	health = health - damage
	if health <= 0 and !dead:
		death()

func death():
	dead = true
	queue_free()

#func deal_with_damage():
	#if player_inattack_zone and global.player_current_attack == true:
		##if can_take_damage == true:
			#health = health - 20
			##$take_damage_cooldown.start()
			##can_take_damage = false
			#print("enemigo herido", health)
			#if health <= 0:
				#self.queue_free()
#

#func _on_take_damage_cooldown_timeout():
	#can_take_damage = true
#


func _on_enemy_hitbox_area_entered(area):
	var damage
	print("dentro del area")
	if area.has_method("lapiz_deal_damege"):
		damage = 50
		take_damage(damage)
