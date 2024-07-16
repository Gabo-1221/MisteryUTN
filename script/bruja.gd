extends CharacterBody2D

var player_chase = false
var player = null
var enfriar_lanzar = true
var dead = false
var health = 100
var player_inattack_zone = false
var can_take_damage =  true
var posima = preload("res://materiales/posima.tscn")


func _physics_process(_delta):
	update_health()
	lanzar(_delta)

func lanzar(_delta):
	if !dead:
		if player_chase:
			var ubicacion = player.global_position
			chance_anima_direction(player.global_position)
			launch_things(ubicacion)
			
func chance_anima_direction(ubicacion):
	var direction = ubicacion - global_position
	var angle = direction.angle()

	if abs(angle) < PI / 4:
		$AnimatedSprite2D.play("mantener_derecha")
	elif abs(angle) > 3 * PI / 4:
		$AnimatedSprite2D.play("mantener_izquierda")
	elif angle < -PI / 4 and angle > -3 * PI / 4:
		$AnimatedSprite2D.play("mantener_arriba")
	else:
		$AnimatedSprite2D.play("mantener_abajo")

func launch_things(ubicacion):
	if enfriar_lanzar:
		enfriar_lanzar = false
		var posima_instante = posima.instantiate()
		var direction = (ubicacion - global_position).normalized()
		posima_instante.global_position = global_position + direction * 10  # Ajusta la distancia según sea necesario
		posima_instante.rotation = direction.angle()
		add_child(posima_instante)
		
		await get_tree().create_timer(1).timeout
		enfriar_lanzar = true

func enemigo():
	pass
  
func _on_enemy_hitbox_area_entered(area):
	var damage
	#print("dentro del area")
	if area.has_method("lapiz_deal_damege"):
		damage = 50
		take_damage(damage)
		area.queue_free() 

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_chase = true
		player = body

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_chase = false

func take_damage(damage):
	health = health - damage
	if health <= 0 and !dead:
		death()

func update_health():
	var health_bar = $healthBar
	health_bar.value = health
	
	if health >= 100:
		health_bar.visible = false
	else:
		health_bar.visible = true

func death():
	dead = true
	queue_free()
