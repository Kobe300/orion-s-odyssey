#class_name StateMachine

extends Node

@export var initial_state : State # Path to the initial active state. We export it to be able to pick the initial state in the inspector.

var current_state: State # The current active state. At the start of the game, we get the `initial_state`. 


func init(parent: Player) -> void:
	for child in get_children():
		child.parent = parent 
		
	#Initialize to the default state
	Change_State(initial_state)

#Change State
func Change_State(new_state: State) -> void:
	if current_state:
		current_state.Exit()
	
	current_state = new_state
	current_state.Enter()


func Process_Physics(delta: float) -> void:
	var new_state = current_state.Process_Physics(delta)
	if new_state:
		Change_State(new_state)


func Process_Input(event: InputEvent) -> void:
	var new_state = current_state.Process_Input(event)
	if new_state:
		Change_State(new_state)


func Process_Frame(delta: float) -> void:
	var new_state = current_state.Process_Frame(delta)
	if new_state:
		Change_State(new_state)
