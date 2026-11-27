@tool
extends StaticBody2D

var size: int
var style: int

func _ready() -> void:
	size = randi_range(0, $Decoration.hframes - 1)
	style = [0,1].pick_random()
	$Decoration.frame_coords = Vector2(size, style)

	if size < 2:
		$CollisionShape2D.disabled = true
		z_index = -1
