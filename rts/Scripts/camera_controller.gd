extends Camera2D

@export var move_speed : float = 70
@export var zoom_amount : float = 0.2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_move(delta)
	_zoom(delta)

func _move(delta: float) -> void:
	var input = Input.get_vector("cam_left", "cam_right", "cam_up", "cam_down")
	var _zoom_mod = 6 - zoom.x
	
	global_position += input * delta * move_speed
	
func _zoom(_delta: float) -> void:
	var z = zoom.x
	
	if Input.is_action_just_released('zoom_in'):
		z += zoom_amount
	
	elif Input.is_action_just_released('zoom_out'):
		z -= zoom_amount
		
	z = clamp(z, 1, 5)
	
	zoom.x = z
	zoom.y = z
