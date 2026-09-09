extends Panel

@onready var button_container = $ButtonContainer
var ca_buttons : Array[CombatActionButton]

@onready var description_text : RichTextLabel = $Description
@onready var game_manager = $"../.."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in button_container.get_children():
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
