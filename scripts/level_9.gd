extends Control

# Function called when a card is clicked
func on_card_clicked(card_data: Dictionary):
	# Debug: Print the card data when clicked
	print("Card clicked with data: ", card_data)
	
	# Store card data in the Globals singleton
	Globals.card_data = card_data
	print("Stored card data in Globals: ", Globals.card_data)  # Debugging the data storage
	
	# Change the scene to the next one
	# get_tree().change_scene_to_file("res://scenes/level_10.tscn")

# Function to connect each card button's signal
func _ready():
	var grid_container = $Backround/GridContainer
	for button in grid_container.get_children():
		if button is TextureButton:
			# Retrieve card data
			var texture_rect = button.get_node("TextureRect")
			var label = button.get_node("Label")
			var card_data = {
				"image": texture_rect.texture, # Get the card image
				"type": label.text,            # Get the card type
				"points": randi() % 100        # Example points (randomized)
			}
			
			# Debug: Print the card data before binding it to the button signal
			print("Card data before binding: ", card_data)
			
			# Connect the button press signal
			button.pressed.connect(on_card_clicked.bind(card_data))
