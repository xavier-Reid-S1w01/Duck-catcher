extends Area2D

@export var fall_speed: float = 150.0 
var rotation_velocity = randf_range(0.5, 2.0)
var screen_height = 0

func _ready():
	screen_height = get_viewport().get_visible_rect().size.y
	add_to_group("ducks")

func _process(delta: float) -> void:
	position.y += fall_speed * delta
	rotation += rotation_velocity * delta

	if position.y > screen_height:
		queue_free()
