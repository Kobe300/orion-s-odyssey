#class_name Attack

extends State

@export var idle_state: State
@export var move_state: State
@export var jump_state: State
@export var fall_state: State

# Called when the node enters a state.
func enter() -> void:
	parent.animations.play(animation_name)

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
	parent.velocity.y += gravity * delta
	
	if parent.velocity.y > 0:
		return fall_state
	
	var movement = Input.get_axis('move_left', 'move_right') * MOVESPEED
	
	if movement != 0:
		parent.animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	
	return null
