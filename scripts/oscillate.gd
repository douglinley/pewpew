extends Node2D

# Define variables for movement parameters
@export var speed = 100  # Adjust this value to control the vertical speed
@export var amplitude = 50  # Adjust this value to control the oscillation range
@export var direction = 1  # 1 for moving right, -1 for moving left
@export var initial_position = Vector2(0, 0)  # Store the initial position
@export var freq = 50

func _ready():
	# Store the initial position of the object
	initial_position = position

func _process(delta):
	# Move the object downward
	position.y += speed * delta

	# Calculate the oscillation along the X-axis using sin
	position.x = initial_position.x + amplitude * sin(position.y / freq)  # Adjust the division value for the oscillation frequency

	# Reverse direction when reaching the screen boundaries
	if position.x > initial_position.x + amplitude:
		direction = -1
	elif position.x < initial_position.x - amplitude:
		direction = 1

	# Update X position based on direction
	position.x += direction * speed * delta
