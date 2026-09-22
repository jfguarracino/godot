extends BaseButton
class_name BuySeedButton

@export var crop_data : CropData
@onready var price_text : Label = $PriceText
@onready var icon : TextureRect = $Icon

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_on_pressed)
	
	if not crop_data:
		return
		
	price_text.text = "$" + str(crop_data.seed_price)
	icon.texture = crop_data.growth_sprites[len(crop_data.growth_sprites) - 1]


func _on_pressed():
	GameManager.try_buy_seed(crop_data)
