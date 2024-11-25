extends Control

# Attach this script to the GridContainer node

func _ready():
	for child in get_children():
		if child is TextureButton:
			# Set the exact size for the TextureButton
			child.custom_minimum_size = Vector2(600, 600)  # Replace with desired width and height

# Function to handle button press and switch scenes
func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_7.tscn")
