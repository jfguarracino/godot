@abstract
class_name CardData
extends Resource

@export var display_name : String
@export var cost : int = 1
@export var icon : Texture2D

@abstract
func get_description() -> String

@abstract
func cast(data : CastData)

@abstract
func get_value() -> int

class CastData:
	var caster : Character
	var opponent : Character
