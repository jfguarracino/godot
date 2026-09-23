extends CharacterBody2D

@export var max_speed : float = 100
@export var acceleration : float = 0.2
@export var braking : float = 0.15

@onready var sprite : Sprite2D = $Sprite2D

var move_input : Vector2

func _physics_process(delta: float) -> void:
	move_input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if move_input.length() > 0:
		velocity = velocity.lerp(move_input * max_speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, braking)
	
	move_and_slide()

func _process(delta):
	sprite.flip_h = get_global_mouse_position().x > global_position.x
