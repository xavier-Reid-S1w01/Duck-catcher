extends Node2D
# Controls duck spawning


@export var ducks_per_spawn: int = 1
# Number of ducks to spawn each time the spawn timer triggers


@onready var duck_prefab = preload("res://duck.tscn")
# Preload the duck scene

func _on_duck_spawn_timer_timeout() -> void:
	# Called when Duck Spawn Timer runs out
	# Creating new ducks in the scene

	for i in range(ducks_per_spawn):
		# Instantiate a new duck from the preloaded prefab
		var duck = duck_prefab.instantiate()

		# Set duck's position at a random location
		duck.position = Vector2(
			randi_range(10, get_viewport_rect().size.x - 10), 
			-50
		)

		# Duck rotation
		duck.rotation = randf_range(0, 2 * PI)

		# Add the new duck to the scene tree
		add_child(duck)
