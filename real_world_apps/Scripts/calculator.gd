extends Control


func _on_zero_resized() -> void:
	@warning_ignore('integer_division')
	%Zero.offset_left = -get_window().size.x / 4
