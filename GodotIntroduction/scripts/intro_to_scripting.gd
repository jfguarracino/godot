extends Node2D

func _ready ():
	print(_has_won(120))

func _has_won (score : int) -> bool:
	return score >= 100
