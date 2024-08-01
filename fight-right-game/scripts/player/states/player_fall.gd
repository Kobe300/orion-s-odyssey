#class_name Fall

extends State

@export var ground_state : State
@export var fall_animation : String = "jump"

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
func process_physics(delta: float):
		if(character.is_on_floor()):
			next_state = ground_state
			


func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == fall_animation):
		next_state = ground_state


