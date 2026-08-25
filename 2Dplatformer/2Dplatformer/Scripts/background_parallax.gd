extends Node2D

var parallax : float = 0.7
@onready var player = $"../Player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = player.global_position * parallax
