#class_name Attack

extends State

@export var idle_state: State
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
func process_input(event: InputEvent) -> State:
	return null

# Corrisponds with the _physics_process() in "state_machine" script
func process_physics(delta: float) -> State:
	if character.velocity.y > 0:
		return fall_state

	
	if character.is_on_floor():
		#if direction.x != 0:
			#return move_state
		#return idle_state
		pass
	
	return null
