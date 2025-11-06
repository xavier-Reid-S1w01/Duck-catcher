extends Area2D



@export var SPEED: float = 600.0              # How fast the player moves
@export var score_label: Label                # Reference to the on-screen score label

# --- Internal variables ---
var velocity = Vector2()                      # Stores the player’s movement direction
var screen_width = 0                          # Width of the game screen
var score = 0                                 # Current score

func _ready():
	# Stop the player going off screen
	screen_width = get_viewport().get_visible_rect().size.x
	

func _process(delta):
	
	# Input direction 
	var direction = Input.get_axis("ui_left", "ui_right")
	
	# Apply direction to velocity and move the player horizontally
	velocity.x = direction * SPEED
	position.x += velocity.x * delta
	
	# Keep player with in screen boundaries
	position.x = clamp(position.x, 0, screen_width)


func _on_area_entered(area):
	# Collision
	print("area_entered called. area:", area, " groups:", area.get_groups())

	# Safety check
	if not is_instance_valid(area):
		print(" -> area not valid")
		return

	# Check if the area is a duck
	if area.is_in_group("ducks"):
		# Increase score by 1
		score += 1

		# Change score
		if score_label:
			score_label.text = "Score: " + str(score)
		else:
			print("Warning: score_label is not assigned on Player")

		# Remove (free) the duck from the scene after catching it
		if is_instance_valid(area):
			area.queue_free()
