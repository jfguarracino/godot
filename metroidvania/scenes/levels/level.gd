extends Node2D

var bullet_scene = preload("res://scenes/bullets/bullet.tscn")
var explosion_scene = preload("res://scenes/bullets/explosion.tscn")

func _ready() -> void:
	for drone in get_tree().get_nodes_in_group('Drones'):
		drone.connect('explode', create_explosion)

func create_explosion(pos: Vector2):
	var explosion = explosion_scene.instantiate()
	explosion.setup(pos)
	call_deferred('_add_explosion', explosion)


func _add_explosion(explosion):
	$Bullets.add_child(explosion)


func _on_player_shoot(pos: Vector2, dir: Vector2, gun_type: Data.Gun) -> void:
	if gun_type != Data.Gun.SHOTGUN:
		var bullet = bullet_scene.instantiate()
		bullet.connect('explode', create_explosion)
		$Bullets.add_child(bullet)
		bullet.setup(pos, dir, gun_type)
		
	else:
		for drone in get_tree().get_nodes_in_group('Drones'):
			var aim_angle = rad_to_deg(dir.angle())
			var enemy_angle = rad_to_deg((drone.position - pos).angle())
			
			if abs(aim_angle - enemy_angle) < 60 and pos.distance_to(drone.position) < 100:
				drone.hit()
				 
			
