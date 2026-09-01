extends CanvasLayer

@onready var health_container = $heart_container
var hearts : Array = []

@onready var score_text : Label = $score_text

func _ready():
	hearts = health_container.get_children()
	
	var player = get_parent()
	
	player.OnTakeDamage.connect(_update_hearts)
	player.OnUpdateScore.connect(_update_score_text)
	
	_update_score_text(PlayerStats.score)
	_update_hearts(player.health)

func _update_hearts(health : int) -> void:
	for i in len(hearts):
		hearts[i].visible = i < health 
	
func _update_score_text(score : int) -> void:
	score_text.text = 'Score: ' + str(score)
