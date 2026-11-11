extends Tower

func _ready() -> void:
	type = Data.Tower.BASIC


func _process(_delta: float) -> void:
	if enemies.size() > 0:
		$Turret.look_at(enemies[0].global_position)
		$Turret.rotation -= PI/2


func _on_reload_timer_timeout() -> void:
	if enemies:
		var dir = Vector2.DOWN.rotated($Turret.rotation).normalized()
		shoot.emit(position + dir * 16, $Turret.rotation, bullet_type)


func tower_upgrade():
	$Base.texture = load("res://graphics/towers/basic/basic tower upgrade bottom.png")
	$Turret.texture = load("res://graphics/towers/basic/basic tower upgrade top.png")
