class_name GameManager
extends Node

signal ManaChanged(cur: int, max : int)

@export var player : Character
@export var enemy : Character

var current_mana : int
var max_mana : int = 3

func _enter_tree() -> void:
	ManagerRegistry.register('game_manager', self)
	
func _exit_tree() -> void:
	ManagerRegistry.unregister('game_manager')
	
func _ready() -> void:
	reset_mana()

func spend_mana(amount : int):
	current_mana -= amount
	ManaChanged.emit(current_mana, max_mana)
	
func reset_mana():
	current_mana = max_mana
	ManaChanged.emit(current_mana, max_mana)
