#class_name Sword
extends State

@export var ground_state : State
@export var kick_state: State

@onready var timer : Timer = $AttackTimer

# Called when the node enters a state.
func enter():
	playback.travel("sword_attack_1")
	#pass

# Called when the node exit a state.
func exit() -> void:
	pass

# Corrisponds with the _process() in "state_machine" script
func process_input(event: InputEvent):
	if (Input.is_action_just_pressed("attack")): 
		timer.start()
	#pass
	
	if (Input.is_action_just_pressed("kick")):
		next_state = kick_state

#Corrisponds with the _ physics_process() in "state_machine" script
func process_physics(delta: float):
	pass
 
# Execute when animation is finished
func _on_animation_tree_animation_finished(anim_name):
	if(timer.is_stopped()):
		next_state = ground_state
	else:
		playback.travel("sword_attack_2")
		attack_face()
		
	if(anim_name == "sword_attack_2"):
		if(timer.is_stopped()):
			next_state = ground_state
		else:
			playback.travel("sword_attack_3")
			attack_face()
	
	if(anim_name == "sword_attack_3"):
		if(timer.is_stopped()):
			next_state = ground_state
		else:
			next_state = ground_state
