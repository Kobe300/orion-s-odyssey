extends Node

class_name State

@export var can_move : bool = true

var animation_name : String
var character : CharacterBody2D
var playback : AnimationNodeStateMachinePlayback
var next_state : State

func process_input(event : InputEvent):
	pass

func process_physics(deltae):
	pass

func enter():
	playback.travel(animation_name)
	#pass

func exit():
	pass
