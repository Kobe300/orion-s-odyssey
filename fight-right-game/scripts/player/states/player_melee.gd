#class_name Melee
extends State

@export var ground_state : State
@export var kick_state: State
@export var collapse_state: State

@onready var timer : Timer = $AttackTimer

# Called when the node enters a state.
func enter():
	playback.travel("melee_attack_1")
	timer.start()
	#print('Character in Attack State')
	attack_face(2)
	stamina_drain()
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

#Corrisponds with the _physics_process() in "state_machine" script
func process_physics(delta: float):
	if (stamina_component.stamina <= 0):
		next_state = collapse_state
 
# Execute when animation is finished
func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "melee_attack_1"):
		if(timer.is_stopped()):
			next_state = ground_state
		else:
			if (stamina_component.stamina <= 0):
				next_state = collapse_state
			else :
				playback.travel("melee_attack_2")
				attack_face(2)
				stamina_drain()
		
	if(anim_name == "melee_attack_2"):
		if(timer.is_stopped()):
			next_state = ground_state
		else:
			if (stamina_component.stamina <= 0):
				next_state = collapse_state
			else :
				playback.travel("melee_attack_3")
				attack_face(2)
				stamina_drain()
	
	if(anim_name == "melee_attack_3"):
		if(timer.is_stopped()):
			next_state = ground_state
		else:
			next_state = ground_state
