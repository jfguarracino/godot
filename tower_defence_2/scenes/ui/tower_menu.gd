extends Control

signal upgrade_press

func _on_upgrade_button_pressed() -> void:
	upgrade_press.emit()
