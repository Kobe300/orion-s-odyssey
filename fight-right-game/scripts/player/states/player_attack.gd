#class_name Attack
extends State

@export var ground_state: State
# Called when the node enters a state.
func enter() -> void:
	print('Character in Attack State')
	#pass

# Called when the node exit a state.
func exit() -> void:
	playback.travel("move")
	print(" Exit Attack State")

# Corrisponds with the _process() in "state_machine" script
func process_input(event: InputEvent):
	pass

#Corrisponds with the _physics_process() in "state_machine" script
func process_physics(delta: float):
	#if(character.is_on_floor()):
		#next_state = ground_state
		#pass
	pass


#func _on_animation_player_animation_finished(anim_name):
	#if (anim_name == "attack_1"):
		#next_state = ground_state
		#print("attack animation played")
		
