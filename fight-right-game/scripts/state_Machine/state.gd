extends Node

class_name State

@export var can_move : bool = true
var sword : bool = false #temporary varible put on player

var animation_name : String
var character : CharacterBody2D
var playback : AnimationNodeStateMachinePlayback
var next_state : State

func process_input(event : InputEvent):
	pass

func process_physics(delta):
	pass

func enter():
	playback.travel(animation_name)
	#pass

func exit():
	pass

func attack_face():		
	var new_position = character.global_position + Vector2(character.direction.x * 2, 0)  # Calculate the new position based on the direction and a speed factor (5 in this case)
	character.global_position = new_position # Instantly move the character to the new position
#character.velocity.x = character.direction.x * 5
#character.move_and_slide()
