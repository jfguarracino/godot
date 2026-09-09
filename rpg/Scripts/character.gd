extends Node2D

class_name  Character

signal OnTakeDamage(health : int)
signal OnHeal(health : int)

@export var is_player : bool
@export var cur_health : int
@export var max_health : int

# combat actions array

var target_scale : float = 1
@onready var audio : AudioStreamPlayer = $AudioStreamPlayer
var take_damage_sfx :AudioStream = preload("res://Audio/take_damage.wav")
var heal_sfx : AudioStream = preload("res://Audio/heal.wav")

func begin_turn() -> void:
	target_scale = 1.1
	
func end_turn() -> void:
	target_scale = 0.9

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func take_damage(amount : int) -> void:
	pass
	
func heal(amount : int) -> void:
	pass
	
func cast_combat_action(action, opponent : Character) -> void:
	pass
	
func _play_audio(stream : AudioStream) -> void:
	pass
