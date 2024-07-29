#class_name Fall

extends State

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
	return null
