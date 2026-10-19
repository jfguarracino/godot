class_name GameManager
extends Node

signal ManaChanged(cur: int, max : int)
signal TurnBegan(character : Character)
signal TurnEnded(character : Character)

@export var player : Character
@export var enemy : Character

var current_mana : int
var max_mana : int = 3
var current_character : Character
var is_player_turn : bool:
	get: return current_character == player
	
@onready var character_highlight : Node2D = $CharacterHighlight

func _enter_tree() -> void:
	ManagerRegistry.register('game_manager', self)
	
func _exit_tree() -> void:
	ManagerRegistry.unregister('game_manager')
	
func _ready() -> void:
	_next_character_turn()
	
func _next_character_turn():
	if current_character == null:
		current_character = player
		
	else:
		current_character = player if current_character == enemy else enemy
		
	if current_character == player:
		reset_mana()
	
	character_highlight.global_position.x = current_character.global_position.x
	TurnBegan.emit(current_character)
	
func end_character_turn():
	TurnEnded.emit(current_character)
	_next_character_turn()

func spend_mana(amount : int):
	current_mana -= amount
	ManaChanged.emit(current_mana, max_mana)
	
func reset_mana():
	current_mana = max_mana
	ManaChanged.emit(current_mana, max_mana)
