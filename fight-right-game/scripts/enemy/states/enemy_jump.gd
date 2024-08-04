#class_name Jump
extends State

@export var fall_state: State
@export var fall_animation : String = "fall"

# Called when the node enters a state.
func enter():
	playback.travel("jump")
	print('Character in Jump State')
	#pass

# Called when the node exit a state.
func exit():
	#if(next_state == fall_state):
		#playback.travel("fall")
	pass

#
func process_input(event: InputEvent) -> State:
	## to add levetation state
	#if(event.is_action_pressed("jump") && !is_levetaion):
			#levetation()
	return null
	
# 
func process_physics(delta: float):
	if(!character.is_on_floor()):
		next_state = fall_state
	
#
func levetaion():
	#_levitaion = true
	pass


	## to add levitation state
	#if(next_state == levetation_state):
		#playback.travel(flight_animation)
		#is_levetaion = true      
