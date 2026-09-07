extends AudioStreamPlayer

@export var take_damage_sfx : AudioStream

func _ready() -> void:
	var unit = get_parent()
	
	unit.OnTakeDamage.connect(_play_take_damage_sfx)

func _play_take_damage_sfx(_health : int) -> void:
	_play_sound(take_damage_sfx)

func _play_sound(audio : AudioStream) -> void:
	stream = audio
	play()
