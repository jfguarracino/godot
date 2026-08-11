extends Sprite2D

var speed : float = 100
var direction = Vector2(1, 1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(500, 200)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += speed * delta * direction
