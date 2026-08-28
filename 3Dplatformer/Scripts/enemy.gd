extends Area3D

@export var move_speed : float = 2
@export var move_direction : Vector3
@export var spin_speed : float = 900

@onready var start_pos : Vector3 = global_position
@onready var target_pos : Vector3 = start_pos + move_direction
@onready var model = $model

func _process(delta : float) -> void:
	pass
	
func _on_body_entered(body: Node3D) -> void:
	if not body.is_in_group('player'):
		return
		
	print('take damage')
