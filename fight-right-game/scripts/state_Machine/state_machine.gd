class_name StateMachine
extends Node

@export var character : CharacterBody2D
@export var animation_tree : AnimationTree
@export var current_state: State # The current active state. At the start of the game, we get the `initial_state`. 

var states : Array[State]

func _ready():
	for child in get_children():
		if(child is State):
			states.append(child)

			child.character = character
			child.playback = animation_tree["parameters/playback"]

		else:
			push_warning("Child " + child.name + "is not a Name of " + character.name)

#Change State
func change_state(new_state : State) -> void:
	if (current_state != null):
		current_state.exit() # To ensure state is cleared before moving on to the next state
		current_state.next_state = null

	current_state = new_state
	current_state.enter()
	print("state was changed")

#process States 60 times a seconds
func _physics_process(delta: float) -> void:
	if (current_state.next_state != null):
		change_state(current_state.next_state)
		
	current_state.process_physics(delta)


func check_can_move():
	return current_state.can_move	


func _input(event: InputEvent):
	current_state.process_input(event)
