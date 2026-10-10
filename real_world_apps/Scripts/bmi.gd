extends Control

@onready var height_entry = $VBoxContainer/HeightInput/PanelContainer/MarginContainer/VBoxContainer/LineEdit
@onready var height_slider = $VBoxContainer/HeightInput/PanelContainer/MarginContainer/VBoxContainer/Control/HSlider
@onready var weight_entry = $VBoxContainer/WeightInput/PanelContainer/HBoxContainer/LineEdit
@onready var bmi_label = $VBoxContainer/Output/Label

var height : int = 166:
	set(value):
		height = value
		update_bmi()
		
var weight : int = 62:
	set(value):
		weight = value
		update_bmi()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	height_entry.text = str(height)
	height_slider.value = height
	weight_entry.text = str(weight)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_h_slider_value_changed(value: float) -> void:
	height = int(value)


func update_bmi():
	var bmi : float = weight / (pow(height, 2) * 0.01) * 100
	bmi_label.text = str(snapped(bmi, 0.1))


func _on_minus_button_pressed() -> void:
	weight -= 1


func _on_plus_button_pressed() -> void:
	weight += 1
