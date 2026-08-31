extends Area3D

@export var rotate_speed : float = 180


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# rotate
	rotation.y += deg_to_rad(rotate_speed) * delta
	
	# bob up and down 


func _on_body_entered(body: Node3D) -> void:
	if not body.is_in_group('player'):
		return
		
	# increase score
	
	# destroy coin
	queue_free()
