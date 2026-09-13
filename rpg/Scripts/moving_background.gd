extends TextureRect

@export var speed : float = 50
@export var extents : float = 512
@onready var start_pos : Vector2 = position
@export var color_lerp : Gradient
 
func _process(delta):
	position.x += speed * delta
	
	if position.x - start_pos.x >= extents:
		position = start_pos
		
	var time = (1 + sin(Time.get_unix_time_from_system())) / 2
	
	modulate = color_lerp.sample(time)
