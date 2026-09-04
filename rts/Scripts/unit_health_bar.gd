extends ProgressBar

@onready var unit : Unit = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_value = unit.max_hp
	value = max_value
	visible = false
	
	unit.OnTakeDamage.connect(_update_value)


func _update_value(health : int) -> void:
	value = health
	visible = value < max_value
