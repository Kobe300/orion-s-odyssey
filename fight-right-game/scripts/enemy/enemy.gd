#class_name Enemy
extends CharacterBody2D

@export var MOVESPEED : float = 130.0
@export var ROAMSPEED : float = 35.0

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree #getnode("AnimationTree")\
@onready  var state_machine : StateMachine = $StateMachine #getnode("state_machine")
@onready var chase: State = $StateMachine/Chase
@onready var roam: State = $StateMachine/Roam

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") # Get the gravity from the project settings to be synced with RigidBody nodes.
var direction :  Vector2 = Vector2.ZERO
var facing_direction : Vector2 = Vector2.RIGHT
var is_waiting = false

func _ready():
	animation_tree.active = true #Ensures animation Tree is always active on game runtime


func _physics_process(delta: float):
	if is_waiting and !chase.player_chase:
		return  # Skip all movement and direction logic if waiting
	
	if !is_on_floor():
		velocity.y += gravity * delta  # Add gravity

	if is_on_wall():
		# Reverse direction if on a wall
		direction *= -1 
	
	if state_machine.check_can_move() and chase.player_chase:
		var chase_direction = (chase.player.position - position).normalized()  # Normalize the chase direction
		position += chase_direction * MOVESPEED * delta  # Move towards the player
		direction = chase_direction
		update_animation_parameters()
		update_player_direction(direction)  # Update the sprite's direction based on chase direction
	elif state_machine.check_can_move() and roam.is_roaming:
		if roam.curr_position:
			direction = (roam.curr_position.position - position).normalized()
			position += direction * ROAMSPEED * delta
			update_animation_parameters()
			update_player_direction(direction)  # Update direction if not chasing'
			
			# Check if the enemy has reached the current position
			print(roam.curr_position.position.x)
			print(round(position.x))
			print(round(position.y))
			if roam.curr_position.position.x == round(position.x):
				await start_waiting()
		else:
			print('no positions available')

	determine_face_direction()
	move_and_slide()
	
	#print(facing_direction)

# Updates the animation parameters for movement
func update_animation_parameters():
	if !chase.player_chase:
		animation_tree.set("parameters/move/blend_position", direction.x)
	else:
		animation_tree.set("parameters/move/blend_position", direction.x * 2)

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

func start_waiting() -> void:
	is_waiting = true  # Enter waiting state
	position.y = -20
	velocity = Vector2.ZERO  # Stop all movement
	await get_tree().create_timer(2.5).timeout  # Wait for 2 seconds
	roam._get_next_position()
	is_waiting = false  # Exit waiting state
