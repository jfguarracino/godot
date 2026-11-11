extends Tower

func _ready() -> void:
	type = Data.Tower.BLAST


func _on_reload_timer_timeout() -> void:
	if enemies.size() > 0:
		fire_animation()
		shoot.emit(position, 0, bullet_type)


func fire_animation():
	for particle : GPUParticles2D in $Particles.get_children():
		particle.emitting = true


func tower_upgrade():
	$Base.texture = load("res://graphics/towers/blaster/blaster upgrade.png")
