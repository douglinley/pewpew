extends CharacterBody2D

signal fire(bullet_scene : PackedScene)

@export var speed: float = 400.0
@onready var muzzle : Marker2D = $Muzzle
var bullet_scene : PackedScene = preload("res://Prefabs/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta) -> void:
	handle_input();
	move_and_slide()
	scale = scale.lerp(Vector2(1, 1), 10 * delta)
	
	
func handle_input() -> void:
	var input_direction : Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
		
	if Input.is_action_just_pressed("shoot"):
		fire.emit(bullet_scene)
		scale = Vector2(.5, 1.5)
