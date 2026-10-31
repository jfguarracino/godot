extends CharacterBody2D

var direction : Vector2i = Vector2i.RIGHT
var player : CharacterBody2D
var health : int = 2
var speed : float = 20

func move():
	velocity = direction * speed * int(player is not CharacterBody2D)
	
	move_and_slide()


func animation():
	$Sprite.flip_h = direction.x < 0
	
	if direction:
		$Animation.current_animation = 'run'
	
	if player:
		$Animation.current_animation = 'shoot_h'


func _physics_process(delta: float) -> void:
	move()
	animation()


func _on_floor_left_area_body_exited(_body: Node2D) -> void:
	direction = Vector2i.RIGHT


func _on_floor_right_area_body_exited(_body: Node2D) -> void:
	direction = Vector2i.LEFT


func _on_player_area_body_entered(body: Node2D) -> void:
	player = body


func _on_player_area_body_exited(body: Node2D) -> void:
	player = null
