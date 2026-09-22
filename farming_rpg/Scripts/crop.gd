extends Node2D
class_name Crop

var crop_data : CropData
var days_until_grow : int
var watered : bool
var harvestable : bool
var tile_map_coords : Vector2i

@onready var sprite : Sprite2D = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.NewDay.connect(_on_new_day)

func set_crop(data : CropData, already_watered : bool, tile_coords : Vector2i):
	crop_data = data
	watered = already_watered
	tile_map_coords = tile_coords
	harvestable = false
	
	days_until_grow = data.days_to_grow
	sprite.texture = crop_data.growth_sprites[0]
	
func _on_new_day(day : int):
	if not watered:
		return
		
	watered = false
	
	if days_until_grow != 1:
		days_until_grow -= 1
		
	else:
		harvestable = true
		
	var sprite_count : int = len(crop_data.growth_sprites)
	var growth_percent : float = (crop_data.days_to_grow - days_until_grow) / float(crop_data.days_to_grow)
	var index : int = floor(growth_percent * sprite_count)
	index = clamp(index, 0, sprite_count - 1)
	
	sprite.texture = crop_data.growth_sprites[index]
