extends Area2D
class_name Unit

signal OnTakeDamage(health : int)
signal OnDie(unit : Unit)

@export var move_speed : float = 20

@export var cur_hp : int = 20
@export var max_hp : int = 20

@export var attack_range : float = 20
@export var attack_rate : float = 0.5
var last_attack_time : float
@export var attack_damage : int = 5

enum TEAM{PLAYER, AI}
@export var team : TEAM

var attack_target : Unit

@onready var agent : NavigationAgent2D = $NavigationAgent2D

func _process(delta : float) -> void:
	if not agent.is_target_reached():
		_move(delta)
	
func _move(delta : float) -> void:
	var move_pos : Vector2 = agent.get_next_path_position()
	var move_dir : Vector2 = global_position.direction_to(move_pos)
	var movement : Vector2 = move_dir * move_speed * delta
	
	translate(movement)
	
func _target_check():
	pass
	
func _try_attack_target():
	pass
	
func set_move_to_target(target : Vector2):
	agent.target_position = target
	attack_target = null
	
func set_attack_target(target : Unit):
	pass
	
func take_damage(amount : int):
	pass
	
func _die():
	pass
	
