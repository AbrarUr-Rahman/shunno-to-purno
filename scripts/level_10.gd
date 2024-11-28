extends Control

# Function to populate UI with the card data
func _ready():
	# Retrieve card data from the Globals singleton
	var card_data = Globals.card_data
	
	# Set the UI elements with the data
$Backround/GridContainer/TextureButton4/TextureRect.texture= card_data["image"]
	$VBoxContainer/Label.text = "Card Type: %s" % card_data["type"]
	$VBoxContainer/Label2.text = "Points: %d" % card_data["points"]
