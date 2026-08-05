extends Sprite2D

var speed : float = 10.0
# Called when the node enters the scene tree for the first time.
func _process (delta):
	var direction = Vector2(1, 1)
	position+= speed * delta * direction
