extends Node2D

@export var level_buttons : Array[Button]

func _ready() -> void:
	for i in len(level_buttons):
		level_buttons[i].pressed.connect(_on_level_button.bind(i))
		
		
func _on_level_button(level : int):
	get_tree().change_scene_to_file("res://Scenes/battle.tscn")
