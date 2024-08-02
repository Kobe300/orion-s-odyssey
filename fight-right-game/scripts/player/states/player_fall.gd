#class_name Fall

extends State

@export var ground_state : State
@export var fall_animation : String = "fall"


# Called when the node enters a state.
func enter() -> void:
	print('Character in Fall State')
	#pass
# Called when the node exit a state.
func exit() -> void:
	pass

# Corrisponds with the _process() in "state_machine" script
func process_input(event: InputEvent):
	playback.travel("fall")
	#pass

# Corrisponds with the _physics_process() in "state_machine" script
func process_physics(delta: float):
	#playback.travel("fall")
	
	if(character.is_on_floor()): # if player is on ground
		next_state = ground_state # switch to ground state
			
		


