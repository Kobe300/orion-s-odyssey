#class_name Enemy
class_name Enemy
extends CharacterBody2D

@export var damage_taken_text : PackedScene
@export var MOVESPEED : float = 50.0

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree #getnode("AnimationTree")\
@onready  var state_machine : StateMachine = $StateMachine #getnode("state_machine")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") # Get the gravity from the project settings to be synced with RigidBody nodes.
var direction :  Vector2 = Vector2.ZERO
var facing_direction : Vector2 = Vector2.RIGHT

func _ready():
	#GlobalInv.player_ref(self)
	animation_tree.active = true #Ensures animation Tree is always active on game runtime


func _physics_process(delta: float):
	if !is_on_floor():
		velocity.y += gravity * delta #Add gravity

	if is_on_wall():
		# Get the input direction and handle the movement/deceleration.
		direction *= -1 	#controls Player Movement 
	
	if state_machine.check_can_move():
		velocity.x = direction.x * MOVESPEED
	else:
		velocity.x = move_toward(velocity.x, 0, MOVESPEED)
	
	update_animation_parameters()
	update_palyer_direction()
	determine_face_direction()
	move_and_slide()
	
	#print(facing_direction)


func update_animation_parameters():
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



