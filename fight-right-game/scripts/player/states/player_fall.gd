#class_name Fall

extends State

@export var idle_state: State
@export var move_state: State
@export var attack_state: State
@export var jump_state: State

# Called when the node enters a state.
func Enter() -> void:
	pass

# Called when the node exit a state.
func Exit() -> void:
	pass

# Corrisponds with the _process() in "state_machine" script
func Process_Input(event: InputEvent) -> State:
	return null

# Corrisponds with the _physics_process() in "state_machine" script
func Process_Frame(delta: float) -> State:
	return null

# Corrisponds with the _physics_process() in "state_machine" script
func Process_Physics(delta: float) -> State:
	parent.velocity.y += gravity * delta

	var movement = Input.get_axis('walk_left', 'walk_right') * MOVESPEED
	
	if movement != 0:
		parent.animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	return null
