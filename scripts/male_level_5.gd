extends Control

# References to nodes
@onready var bus_animation_player = $Bus/AnimationPlayer
@onready var male_animation_player = $male/AnimationPlayer
@onready var flipped_bus_animation_player = $Flipped_Bus/AnimationPlayer

@onready var timer = $Timer

@onready var male_sprite = $male/AnimatedSprite2D  # Reference to the Female's Sprite2D node
@onready var bus_sprite = $Bus/AnimatedSprite2D  # Reference to the Bus's Sprite2D node
@onready var flipped_bus_sprite = $Flipped_Bus/AnimatedSprite2D # Reference to the Flipped Bus's Sprite2D node
@onready var timer_2: Timer = $Timer2

func _ready():
	# Initially hide the female character and flipped bus
	male_sprite.visible = false
	flipped_bus_sprite.visible = false
	bus_sprite.visible = true  # Ensure the original bus is visible at the start
	
	# Start the bus animation
	start_bus_animation()

func start_bus_animation():
	# Play the bus's movement animation
	bus_animation_player.play("move_bus")
	
	# Connect to the animation_finished signal of the bus's animation player
	bus_animation_player.animation_finished.connect(self._on_bus_animation_finished)

func _on_bus_animation_finished(anim_name: String):
	if anim_name == "move_bus":  # Check if the finished animation is the "move_bus"
		# Hide the original bus and show the flipped bus
		bus_sprite.visible = false  # Hide the original bus
		
		flipped_bus_sprite.visible = true  # Show the flipped bus
		
		# Show the female character after the bus animation finishes
		male_sprite.visible = true
		
		# Start the timer for the female animation to begin
		timer.start(3.0)
		timer.timeout.connect(self._on_timer_timeout)

func _on_timer_timeout():
	# Play the female character's movement animation after the bus animation
	male_animation_player.play("move_male_human")
	
	# Connect to the animation_finished signal of the female's animation player
	male_animation_player.animation_finished.connect(self._on_male_animation_finished)

func _on_male_animation_finished(anim_name: String):
	if anim_name == "move_male_human":  # Check if the finished animation is "move_human"
		# Play the flipped bus's return animation (backward movement)
		flipped_bus_animation_player.play("move_flipped")
		
		# Connect to the flipped bus animation's finish
		flipped_bus_animation_player.animation_finished.connect(self._on_bus_return_finished)

func _on_bus_return_finished(anim_name: String):
	if anim_name == "move_flipped":  # Check if the finished animation is "bus_move_reverse"
		# After the flipped bus moves, we hide the flipped bus and ensure the bus remains hidden
		flipped_bus_sprite.visible = false
		
		# Optionally, we can keep the original bus hidden here or do nothing.
		# If you want to re-enable the bus visibility after some time, you can do that here.
		# For now, we'll leave the bus hidden.
