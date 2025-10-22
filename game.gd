extends Node2D

@export var ducks_per_spawn: int = 1  

@onready var duck_prefab = preload("res://duck.tscn")


func _ready() -> void:
	pass # Replace with function body.



func _process(delta: float) -> void:
	pass


func _on_duck_spawn_timer_timeout() -> void:
	for i in range(ducks_per_spawn):
		var duck = duck_prefab.instantiate()
		duck.position = Vector2(
			randi_range(10, get_viewport_rect().size.x - 10), 
			-50
		)
		duck.rotation = randf_range(0, 2 * PI)
		add_child(duck)
