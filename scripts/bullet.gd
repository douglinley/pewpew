extends Area2D

@export var speed := 700.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_position.y += speed * delta
