#class_name Player
class_name Player
extends CharacterBody2D

@export var MOVESPEED : float = 250.0

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree #getnode("AnimationTree")\
@onready  var state_machine : StateMachine = $StateMachine #getnode("state_machine")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") # Get the gravity from the project settings to be synced with RigidBody nodes.
var direction :  Vector2 = Vector2.ZERO

func _ready():
	GlobalInv.player_ref(self)
	animation_tree.active = true #Ensures animation Tree is always active on game runtime


func _physics_process(delta: float):
	if not is_on_floor():
		velocity.y += gravity * delta #Add gravity

	# Get the input direction and handle the movement/deceleration.
	direction = Input.get_vector("left", "right", "up", "down") 	#controls Player Movement 
	
	if state_machine.check_can_move():
		velocity.x = direction.x * MOVESPEED
	else:
		velocity.x = move_toward(velocity.x, 0, MOVESPEED)
	
	update_animation_parameters()
	update_palyer_direction()
	move_and_slide()


func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position", direction.x)


func update_palyer_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true


