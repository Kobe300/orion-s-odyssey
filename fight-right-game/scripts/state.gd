#class_name State
class_name State
extends Node

@export var can_move: bool = true 

var character : CharacterBody2D
var playback : AnimationNodeStateMachinePlayback
var next_state : State

# Called when the node enters a state.
func enter() -> void:
	pass

# Called when the node exit a state.
func exit() -> void:
	pass

# Corrisponds with the _process() in "state_machine" script
func process_input(event: InputEvent):
	return null

# Corrisponds with the _physics_process() in "state_machine" script
func process_physics(delta: float) -> State:
	return null







