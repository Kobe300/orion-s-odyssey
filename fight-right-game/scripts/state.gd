class_name State
extends Node

@export var animation_name: String
@export var MOVESPEED:  float = 100
		#const SPRINTSPPED = 250.0
		#const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Hold a reference to the parent so that it can be controlled by the state
var parent: Player

# Called to receives events from the `_unhandled_input()` callback.
func handle_input(_event: InputEvent) -> void:
	pass


# Called when the node enters a state.
func enter() -> void:
	parent.playerAnimations.play(animation_name)


# Called when the node exit a state.
func exit() -> void:
	pass


# Corrisponds with the _process() in "state_machine" script
func process_input(event: InputEvent) -> State:
	return null


# Corrisponds with the _physics_process() in "state_machine" script
func process_frame(delta: float) -> State:
	return null

# Corrisponds with the _physics_process() in "state_machine" script
func process_physics(delta: float) -> State:
	return null







