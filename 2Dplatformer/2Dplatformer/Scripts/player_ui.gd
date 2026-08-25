extends CanvasLayer

@onready var health_container = $HealthContainer
var hearts : Array = []

@onready var score_text : Label = $ScoreText
@onready var player = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hearts = health_container.get_children()
	player.OnUpdateHealth.connect(_update_hearts)
	player.OnUpdateScore.connect(_update_score)
	
	_update_hearts(player.health)
	_update_score(PlayerStats.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _update_hearts(health : int) -> void:
	for i in len(hearts):
		hearts[i].visible = i < health

func _update_score(score : int) -> void:
	score_text.text = 'Score: ' + str(score)
