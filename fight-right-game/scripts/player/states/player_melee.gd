#class_name Melee
extends State

@export var ground_state : State

@onready var timer : Timer = $AttackTimer

# Called when the node enters a state.
func enter():
	playback.travel("melee_attack_1")
	timer.start()
	print('Character in Attack State')
	attack_face()
	#pass

# Called when the node exit a state.
func exit() -> void:
	print(" Exit Attack State")
	pass

# Corrisponds with the _process() in "state_machine" script
func process_input(event: InputEvent):
	if (Input.is_action_just_pressed("attack")):
		timer.start()
	#pass

#Corrisponds with the _physics_process() in "state_machine" script
func process_physics(delta: float):
	pass
 
# Execute when animation is finished
func _on_animation_tree_animation_finished(anim_name):
	if(timer.is_stopped()):
		next_state = ground_state
	else:
		playback.travel("melee_attack_2")
		attack_face()
		
	if(anim_name == "melee_attack_2"):
		if(timer.is_stopped()):
			next_state = ground_state
		else:
			playback.travel("melee_attack_3")
			attack_face()
	
	if(anim_name == "melee_attack_3"):
		if(timer.is_stopped()):
			next_state = ground_state
		else:
			next_state = ground_state



