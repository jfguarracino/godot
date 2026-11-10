class_name Tower extends Node2D

var enemies: Array
var type : Data.Tower

@warning_ignore("unused_signal")
signal shoot(pos: Vector2, direction: float, bullet_enum: Data.Bullet)
signal select(tower : Tower)

func _on_enemy_detection_area_area_entered(area: Area2D) -> void:
	if area not in enemies:
		enemies.append(area)


func _on_enemy_detection_area_area_exited(area: Area2D) -> void:
	if area in enemies:
		enemies.erase(area)


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.button_mask == 1:
		select.emit(self)
