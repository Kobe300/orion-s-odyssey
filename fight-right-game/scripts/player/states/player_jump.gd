#class_name Jump

extends State

@export var idle_state: State
@export var move_state: State
@export var attack_state: State
@export var fall_state: State

# Called when the node enters a state.
func enter():
	super()
	parent.velocity.y = -JUMP_FORCE

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



