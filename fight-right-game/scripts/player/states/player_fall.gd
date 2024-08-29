#class_name Fall

extends State

@export var ground_state : State
@export var fall_animation : String = "fall"


# Called when the node enters a state.
func enter() -> void:
	playback.travel("fall")
	#print('Character in Fall State')
	#pass

# Called when the node exit a state.
func exit():
	#playback.stop()
	pass
	
#
func process_input(event: InputEvent) -> State:
	## to add levetation state
	#if(event.is_action_pressed("jump") && !is_levetaion):
			#levetation()
	return null
# 
## Corrisponds with the _physics_process() in "state_machine" script
func process_physics(delta: float):	
	if(character.is_on_floor()): # if player is on ground
		next_state = ground_state # switch to ground state
