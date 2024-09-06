#class_name Enemy
extends CharacterBody2D

@export var MOVESPEED : float = 85.0

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree #getnode("AnimationTree")\
@onready  var state_machine : StateMachine = $StateMachine #getnode("state_machine")
@onready var chase: State = $StateMachine/Chase
@onready var roam: State = $StateMachine/Roam

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") # Get the gravity from the project settings to be synced with RigidBody nodes.
var direction :  Vector2 = Vector2.ZERO
var facing_direction : Vector2 = Vector2.RIGHT

func _ready():
	animation_tree.active = true #Ensures animation Tree is always active on game runtime


func _physics_process(delta: float):
	if !is_on_floor():
		velocity.y += gravity * delta  # Add gravity

	if is_on_wall():
		# Reverse direction if on a wall
		direction *= -1 
	
	if state_machine.check_can_move() and chase.player_chase:
		var chase_direction = (chase.player.position - position).normalized()  # Normalize the chase direction
		position += chase_direction * MOVESPEED * delta  # Move towards the player
		update_animation_parameters()
		update_player_direction(chase_direction)  # Update the sprite's direction based on chase direction
	elif state_machine.check_can_move() and roam.is_roaming:
		if roam.curr_position:
			direction = (roam.curr_position.position - position).normalized()
			position += direction * MOVESPEED * delta
			update_animation_parameters()
			update_player_direction(direction)  # Update direction if not chasing'
			
			# Check if the enemy has reached the current position
			print(position.distance_to(roam.curr_position.position))
			if position.distance_to(roam.curr_position.position) < MOVESPEED * delta:
				roam._get_next_position()
		else:
			print('no positions available')

	
	determine_face_direction()
	move_and_slide()
	
	#print(facing_direction)

# Updates the animation parameters for movement
func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position", direction.x)

# Updates sprite flip based on the direction of movement or chase
func update_player_direction(movement_direction: Vector2):
	if movement_direction.x > 0:
		sprite.flip_h = false  # Face right
	elif movement_direction.x < 0:
		sprite.flip_h = true   # Face left

# Determines which direction the enemy should face
func determine_face_direction():
	if direction == Vector2.ZERO:
		direction = facing_direction  # If no movement, keep current facing direction
	else:
		facing_direction = direction  # Update facing direction based on movement
