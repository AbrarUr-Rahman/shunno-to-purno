extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var texture_button =  $Backround/GridContainer/TextureButton
	texture_button.rect_scale = Vector2(0.5, 0.5)  # Scale the TextureButton
