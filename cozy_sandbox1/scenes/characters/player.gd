extends CharacterBody2D

# movement
var direction : Vector2
@export var speed : float = 200

# animation
@onready var move_state_machine : AnimationNodeStateMachinePlayback = $AnimationTree.get('parameters/MovementStateMachine/playback')

func _physics_process(_delta: float) -> void:
	get_input()
	set_animation()
	
	velocity =  direction * speed
	
	move_and_slide()


func get_input():
	direction = Input.get_vector("left", 'right', 'up', "down")


func set_animation():
	if direction:
		move_state_machine.travel('Move')
		var direction_animation : Vector2 = Vector2(round(direction.x), round(direction.y))
		$AnimationTree.set('parameters/MovementStateMachine/Idle/blend_position', direction_animation)
	
	else:
		move_state_machine.travel('Idle')
