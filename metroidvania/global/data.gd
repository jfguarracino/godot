extends Node

enum Gun {SINGLE, SHOTGUN, ROCKET}
enum Level {SKY, SUBWAY, SEWER}
enum Enemy {DRONE}

var current_level : Level = Level.SUBWAY
var player_health : int = 5
var enemy_data : Dictionary

const LEVEL_PATHS = {
	Level.SKY : "res://scenes/levels/sky.tscn",
	Level.SUBWAY : "res://scenes/levels/subway.tscn",
	Level.SEWER : "res://scenes/levels/sewer.tscn"
}
