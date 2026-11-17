extends CharacterBody2D

# movement
var direction : Vector2
var can_move : bool = true
	
@export var speed : float = 200

# animation
@onready var move_state_machine : AnimationNodeStateMachinePlayback = $AnimationTree.get('parameters/MovementStateMachine/playback')
@onready var tool_state_machine : AnimationNodeStateMachinePlayback = $AnimationTree.get('parameters/ToolStateMachine/playback')

const state_names = {
	Global.Tools.HOE: 'hoe',
	Global.Tools.AXE: 'Axe',
	Global.Tools.SWORD: 'sword',
	Global.Tools.WATER: 'water',
	Global.Tools.FISH: 'fish',
}

func _physics_process(_delta: float) -> void:
	if can_move:
		get_input()
		
	set_animation()
	
	velocity =  direction * speed * int(can_move)
	
	move_and_slide()


func get_input():
	direction = Input.get_vector("left", 'right', 'up', "down")
	
	if Input.is_action_just_pressed('Action'):
		tool_state_machine.travel('sword')
		$AnimationTree.set('parameters/OneShot/request', AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)


func set_animation():
	if direction:
		move_state_machine.travel('Move')
		var direction_animation : Vector2 = Vector2(round(direction.x), round(direction.y))
		$AnimationTree.set('parameters/MovementStateMachine/Idle/blend_position', direction_animation)
		$AnimationTree.set('parameters/MovementStateMachine/Move/blend_position', direction_animation)
		
		for state in state_names.values():
			$AnimationTree.set('parameters/ToolStateMachine/' + state + '/blend_position', direction_animation)
			can_move = false
	
	else:
		move_state_machine.travel('Idle')


func _on_animation_tree_animation_finished(_anim_name: StringName) -> void:
	can_move = true
