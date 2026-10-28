extends Node

enum Gun {SINGLE, SHOTGUN, ROCKET}
enum Level {SKY, SUBWAY, SEWER}

var current_level : Level = Level.SUBWAY

const LEVEL_PATHS = {
	Level.SKY : "res://scenes/levels/sky.tscn",
	Level.SUBWAY : "res://scenes/levels/subway.tscn",
	Level.SEWER : "res://scenes/levels/sewer.tscn"
}
