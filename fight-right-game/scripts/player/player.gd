#class_name Player
class_name Player
extends CharacterBody2D

@export var MOVESPEED : float = 150.0

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree #getnode("AnimationTree")\
@onready  var state_machine : StateMachine = $StateMachine #getnode("state_machine")

@onready var player_health = get_node("/root/Game/Player/PlayerManager/Health")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") # Get the gravity from the project settings to be synced with RigidBody nodes.
var direction :  Vector2 = Vector2.ZERO
var facing_direction : Vector2 = Vector2.RIGHT

func _ready():
	GlobalInv.player_ref(self)
	animation_tree.active = true #Ensures animation Tree is always active on game runtime


func _physics_process(delta: float):
	if !is_on_floor():
		velocity.y += gravity * delta #Add gravity
	
	# Get the input direction and handle the movement/deceleration.
	direction = Input.get_vector("left", "right", "up", "down") 	#controls Enemy Basic Movement 
	
	if state_machine.check_can_move():
		# Character Sprint
		if (Input.is_action_pressed("sprint")): 
			direction.x *= 2
			MOVESPEED = 200.0
		else:
			MOVESPEED = 125.0
			
		velocity.x = direction.x * MOVESPEED
	else:
		velocity.x = move_toward(velocity.x, 0, MOVESPEED)
	
	update_animation_parameters()
	update_palyer_direction()
	determine_face_direction()
	move_and_slide()
	#print(facing_direction)

func update_animation_parameters():
	print(direction.x)
	animation_tree.set("parameters/move/blend_position", direction.x)


func update_palyer_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true


func determine_face_direction():
	if (direction == Vector2.ZERO):
		direction = facing_direction 
	elif (direction != Vector2.ZERO):
		facing_direction = direction
		
	 # Calculate the new position based on the direction and a speed factor (5 in this case)
	#var new_position = character.global_position + Vector2(character.direction.x * 10, 0)
	# Instantly move the character to the new position
	#character.global_position = new_position
	#character.direction = Input.get_vector("left", "right", "up", "down")
	#character.velocity.x = character.direction.x * 5
	#character.move_local_x(character.velocity.x)
	#character.move_and_slide()

func apply_item_effect(item):
	match item["effect"]:
		"Stamina":
			MOVESPEED += 50
			print("Speed increased to ", MOVESPEED)
		"Slot Boost":
			GlobalInv.increase_inventory_size(5)
			print("Slots increased to ", GlobalInv.inventory.size())
		"Heal":
			player_health.heal_player(50)
		_:
			print("There is no effect for this item")

