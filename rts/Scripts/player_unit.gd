extends Node

@onready var selection_visual = $"../selection_visual"

func toggle_selection_visual(toggle : bool):
	selection_visual.visible = toggle
