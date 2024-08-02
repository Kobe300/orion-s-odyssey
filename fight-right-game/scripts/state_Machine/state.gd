extends Node

class_name State

@export var can_move : bool = true

var character : CharacterBody2D
var playback : AnimationNodeStateMachinePlayback
var next_state : State

func process_input(event : InputEvent):
	pass

func process_physics(deltae):
	pass

func enter():
	pass

func exit():
	pass
