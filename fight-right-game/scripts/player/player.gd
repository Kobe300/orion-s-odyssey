extends CharacterBody2D


const WALKSPEED = 100.0
const SPRINTSPPED = 250.0
const JUMP_VELOCITY = -200.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#Decalare the player Sprite
@onready var player_sprite = $PlayerAnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration -1, 0, 1.
	var direction = Input.get_axis("walk_left", "walk_right")
	
	#Flip Sprite
	if direction > 0:
		player_sprite.flip_h = false
	elif direction < 0:
		player_sprite.flip_h = true
		
		
	#Play Animations
	if is_on_floor():	
		if direction == 0:
			player_sprite.play("idle")
		else: 
			player_sprite.play("run")
	else:
		player_sprite.play("jump")
	
	
	if direction:
		velocity.x = direction * SPRINTSPPED
	else:
		velocity.x = move_toward(velocity.x, 0, SPRINTSPPED)

	move_and_slide()
	
