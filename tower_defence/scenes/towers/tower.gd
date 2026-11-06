extends Node2D
class_name Tower

var enemies : Array

signal shoot(pos : Vector2, direction : float, bullet_enum : Data.Bullet)

func _process(_delta: float) -> void:
	pass


func _on_enemy_detection_area_area_entered(area: Area2D) -> void:
	if area not in enemies:
		enemies.append(area)


func _on_enemy_detection_area_area_exited(area: Area2D) -> void:
	if area in enemies:
		enemies.erase(area)
