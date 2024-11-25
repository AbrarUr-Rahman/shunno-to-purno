extends Control

@onready var bus =$Bus  # Reference to the bus node
@onready var bus_animation =$human/AnimationPlayer   # Reference to the bus animation player
@onready var character =$Bus   # Reference to the human node
@onready var character_animation = $Bus/AnimationPlayer   # Reference to the character animation player
@onready var timer = $Timer   # Reference to the Timer node

# Define animation positions
var bus_arrival_position: Vector2 = Vector2(-13, 348)  # Bus will stop at this position
var character_walk_position: Vector2 = Vector2(493, 294)  # Character walks to this position
var bus_leave_position: Vector2 = Vector2(800, 300)  # Bus will leave to this position

func _ready():
	# Start the bus animation to arrive
	bus_animation.play("bus_arrival")  # Play the animation where bus arrives
	timer.start(4.815)  # Start a timer to control when the character starts walking

# Function to handle the character's walking and bus leaving
func _on_Timer_timeout():
	# Move character to the bus
	character_animation.play("walk_to_bus")
	await character_animation.animation_finished  # Wait for character to finish walking
	
	# Once the character reaches the bus, bus will wait
	bus_animation.play("bus_wait")
	
	# Wait for the character to leave the bus area
	character_animation.play("walk_away")
	await character_animation.animation_finished  # Wait for character to finish walking away

	# Once the character is away, bus will leave
	bus_animation.play("bus_leave")
	await bus_animation.animation_finished  # Wait for bus to leave
