extends RigidBody3D

@export var move_speed : float = 2

func _physics_process(delta: float) -> void:
	if Input.is_physical_key_pressed(KEY_LEFT):
		apply_force(Vector3.LEFT * move_speed)
	elif Input.is_physical_key_pressed(KEY_RIGHT):
		apply_force(Vector3.RIGHT * move_speed)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node) -> void:
	if body.is_in_group('tree'):
		get_tree().reload_current_scene.call_deferred()
