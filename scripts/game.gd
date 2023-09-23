extends Node2D

@onready var player_spawn_pos: Marker2D = $PlayerSpawn
@onready var bullet_container: Node2D = $BulletContainer

var player: CharacterBody2D = null

func _ready():
	print ("on_ready called")
	player = get_tree().get_first_node_in_group("player")
	assert(player != null)
	player.global_position = player_spawn_pos.global_position
	player.fire.connect(_on_player_fire)

func _on_player_fire(bullet_scene, pos):
	var bullet: Area2D = bullet_scene.instantiate()
	bullet.global_position = pos
	bullet_container.add_child(bullet)
	print("pew!")
