extends Area2D

@export var target : Data.Level

func _on_body_entered(body: Node2D) -> void:
	TransitionLayer.transition(target, Data.current_level)
