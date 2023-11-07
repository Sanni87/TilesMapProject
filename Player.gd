extends CharacterBody2D


const SPEED = 90.0

@onready var sprite : Sprite2D = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Input direction with arrow keys:
	var direction = Input.get_axis("ui_left", "ui_right")
	
	# Accelerate or stop
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Move the CharacterBody2D
	move_and_slide()

func get_hit() -> void:
	# Just a tween to signal the player getting hit:
	var tween = create_tween().set_loops(3)
	tween.tween_property(sprite, "modulate", Color(1, 0, 0), .1)
	tween.tween_property(sprite, "modulate", Color(1, 1, 1), .1)
