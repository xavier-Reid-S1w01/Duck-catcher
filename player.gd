extends Area2D

@export var SPEED: float = 600.0
@export var score_label: Label  

var velocity = Vector2()
var screen_width = 0
var score = 0

func _ready():
	screen_width = get_viewport().get_visible_rect().size.x
	

func _process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	position.x += velocity.x * delta
	position.x = clamp(position.x, 0, screen_width)


func _on_area_entered(area):
	
	print("area_entered called. area:", area, " groups:", area.get_groups())

	if not is_instance_valid(area):
		print(" -> area not valid")
		return

	
	if area.is_in_group("ducks"):
		score += 1


		if score_label:
			score_label.text = "Score: " + str(score)
		else:
			print("Warning: score_label is not assigned on Player")


		if is_instance_valid(area):
			area.queue_free()
