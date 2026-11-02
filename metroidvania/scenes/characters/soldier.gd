extends CharacterBody2D

var direction : Vector2i = Vector2i.RIGHT
var player : CharacterBody2D
var health : int = 2
var speed : float = 20
var spawn_point : Marker2D

signal shoot(pos : Vector2, dir : Vector2, gun_type : Data.Gun)

func move():
	velocity = direction * speed * int(player is not CharacterBody2D)
	
	move_and_slide()


func animation():
	if health > 0:
		$Sprite.flip_h = direction.x < 0
		
		if direction:
			$Animation.current_animation = 'run'
		
		if player:
			var pos_diff = player.position - position
			$Sprite.flip_h = pos_diff.x < 0
			$Animation.current_animation = 'shoot_h' if pos_diff.y > -60 else 'shoot_up'
			
	else:
		$Animation.current_animation = 'death'


func hit():
	$Hit.play()
	health -= 1
	if health <= 0:
		player = null
		spawn_point.defeated = true
		$ShootTimer.stop()
		
	var tween = create_tween()
	tween.tween_property($Sprite.material, 'shader_parameter/Progress', 1.0, 0.3)
	tween.tween_property($Sprite.material, 'shader_parameter/Progress', 0.0, 0.5)

func stay_dead():
	$Animation.active = false
	$Sprite.frame = 22
	direction = Vector2i.ZERO
	$Collider.disabled = true


func _physics_process(_delta: float) -> void:
	move()
	animation()


func _on_floor_left_area_body_exited(_body: Node2D) -> void:
	direction = Vector2i.RIGHT


func _on_floor_right_area_body_exited(_body: Node2D) -> void:
	direction = Vector2i.LEFT


func _on_player_area_body_entered(body: Node2D) -> void:
	player = body
	$ShootTimer.start()


func _on_player_area_body_exited(_body: Node2D) -> void:
	player = null


func _on_shoot_timer_timeout() -> void:
	if player:
		var dir = (player.position - position).normalized()
		shoot.emit(position + dir * 10, dir, Data.Gun.SINGLE)


func setup(new_spawn_point : Marker2D):
	position = new_spawn_point.global_position
	spawn_point = new_spawn_point
