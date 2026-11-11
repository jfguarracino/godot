extends Tower

func _ready() -> void:
	type = Data.Tower.MORTAR


func show_crosshair():
	$CrosshairSprite.show()


func crosshair_pos_update(pos : Vector2i):
	$CrosshairSprite.global_position = pos


func finish_placing():
	$CrosshairSprite.hide()


func _on_reload_timer_timeout() -> void:
	shoot.emit($CrosshairSprite.global_position, 0, bullet_type)


func tower_upgrade():
	$Base.texture = load('res://graphics/towers/mortar/mortar tower upgrade down.png')
