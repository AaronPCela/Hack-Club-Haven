extends CharacterBody2D

@onready var sprite = $Sprite2D

const SPEED = 150


func _physics_process(delta) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	
	# Only flip if the player is actively moving left or right
	if direction < 0:
		sprite.flip_h = true  # Face left
	elif direction > 0:
		sprite.flip_h = false # Face right
