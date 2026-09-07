extends Node2D

var units = {
	Unit.TEAM.PLAYER : 0,
	Unit.TEAM.AI : 0
}

@onready var end_screen = $CanvasLayer/EndScreen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for unit in get_tree().get_nodes_in_group('Unit'):
		if unit is not Unit:
			continue
		
		units[unit.team] += 1
		unit.OnDie.connect(_on_unit_die)

func _on_unit_die(unit : Unit) -> void:
	units[unit.team] -= 1
	_check_win_condition()
	
func _check_win_condition() -> void:
	var winner = 0
	var teams_alive = 0
	
	for team in units:
		if units[team] > 0:
			teams_alive += 1
			winner = team
			
	if teams_alive > 1:
		return
			
	var team_name = Unit.TEAM.keys()[winner]
	end_screen.set_screen(team_name)
