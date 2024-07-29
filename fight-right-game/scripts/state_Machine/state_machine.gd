#class_name StateMachine
extends Node

@export var initial_state : State # Path to the initial active state. We export it to be able to pick the initial state in the inspector.

var current_state: State # The current active state. At the start of the game, we get the `initial_state`. 


func init(parent: Player) -> void:
	for child in get_children():
		child.parent = parent 
		
	#Initialize to the default state
	change_state(initial_state)

#Change State
func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()


func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)


func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)


func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
