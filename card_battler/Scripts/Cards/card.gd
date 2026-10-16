class_name Card
extends Area2D

enum State
{
	IDLE,
	HOVERED,
	DRAGGING
}

@onready var name_label : Label = $DisplayNameLabel
@onready var cost_label : Label = $CostLabel
@onready var description_label : Label = $DescriptionLabel
@onready var icon_rect : TextureRect = $Icon

@export var data : CardData

var state : State
var idle_pos : Vector2
var hover_pos : Vector2:
	get: return idle_pos + Vector2(0, -30)
var default_z_index : int
var game_manager : GameManager:
	get: return ManagerRegistry.get_manager('game_manager')

func setup(data : CardData) -> void:
	self.data = data
	state = State.IDLE
	
	_setup_visual()

func cast():
	var cast_data : CardData.CastData = CardData.CastData.new()
	cast_data.caster = game_manager.player
	cast_data.opponent = game_manager.enemy
	
	data.cast(cast_data)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var lerp_speed : float = 10
	var target_pos : Vector2 = idle_pos
	
	if state == State.HOVERED:
		target_pos = hover_pos
		lerp_speed = 15
		
	elif state == State.DRAGGING:
		target_pos = get_global_mouse_position()
		lerp_speed = 20
		
	global_position = global_position.lerp(target_pos, delta * lerp_speed)


func _setup_visual():
	name_label.text = data.display_name
	cost_label.text = str(data.cost)
	description_label.text = data.get_description()
	icon_rect.texture = data.icon


func hover_enter():
	state = State.HOVERED
	z_index = 99
	
func hover_exit():
	state = State.IDLE
	z_index = default_z_index
	
func begin_drag():
	state = State.DRAGGING
	
func end_drag():
	state = State.IDLE
