#class_name Attack

extends State

@export var move_state: State
@export var jump_state: State
@export var fall_state: State

# Called when the node enters a state.
func enter() -> void:
	pass

# Called when the node exit a state.
func exit() -> void:
	pass

# Corrisponds with the _process() in "state_machine" script
func process_input(event: InputEvent):
	pass

# Corrisponds with the _physics_process() in "state_machine" script
func process_physics(delta: float):
	pass
	
