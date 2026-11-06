extends Area2D

var direction : Vector2
var speed : int = 200

func setup(pos : Vector2, angle : float, _bullet_enum : Data.Bullet):
	position = pos
	direction = Vector2.DOWN.rotated(angle)
	rotation = angle


func _process(delta: float) -> void:
	position += direction * speed * delta
