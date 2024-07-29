#class_name State
class_name State
extends Node

@export var animation_name: String
@export var MOVESPEED:  float = 250
		#const SPRINTSPPED = 250.0
@export var JUMP_FORCE: float = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Hold a reference to the parent so that it can be controlled by the state
var parent: Player


# Called when the node enters a state.
func Enter() -> void:
	parent.animations.play(animation_name)

# Called when the node exit a state.
func Exit() -> void:
	pass

# Corrisponds with the _process() in "state_machine" script
func Process_Input(event: InputEvent) -> State:
	return null

# Corrisponds with the _physics_process() in "state_machine" script
func Process_Frame(delta: float) -> State:
	return null

# Corrisponds with the _physics_process() in "state_machine" script
func Process_Physics(delta: float) -> State:
	return null







