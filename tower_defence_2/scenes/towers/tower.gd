class_name Tower extends Node2D

var enemies: Array
var type : Data.Tower
var upgraded : bool = false
var bullet_type : Data.Bullet

@warning_ignore("unused_signal")
signal shoot(pos: Vector2, direction: float, bullet_enum: Data.Bullet)
signal select(tower : Tower)

func setup(tower_type : Data.Tower):
	$ReloadTimer.wait_time = Data.TOWER_DATA[tower_type]['reload_time']
	bullet_type = Data.TOWER_DATA[tower_type]['bullet']


func _on_enemy_detection_area_area_entered(area: Area2D) -> void:
	if area not in enemies:
		enemies.append(area)


func _on_enemy_detection_area_area_exited(area: Area2D) -> void:
	if area in enemies:
		enemies.erase(area)


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.button_mask == 1:
		select.emit(self)


func _on_tower_menu_upgrade_press() -> void:
	tower_upgrade()
	$TowerMenu.hide()
	upgraded = true


func tower_upgrade():
	pass
