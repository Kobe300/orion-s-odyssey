#class_Name Kick
extends State

@export var ground_state : State
@export var sword_state: State
@export var melee_state: State
#@export var rest_state: State

@export var stamina_loss: float = 20

@export var stamina_component : StaminaComponent

@onready var timer : Timer = $AttackTimer

func enter():
	playback.travel("kick_attack_1")
	timer.start()
	attack_face()
	
	state.kick = true
	stamina_drain()
	print()
	#pass

func exit():
	state.kick = false
	pass
	
func process_input(event : InputEvent):
	if (Input.is_action_just_pressed("kick")):
		stamina_drain()
		timer.start()
	#pass
	
	# Character Attacks
	if (Input.is_action_just_pressed("attack")): 
		if state.sword:
			next_state = sword_state
		elif not state.sword:
			next_state = melee_state


func process_physics(deltae):
	pass


func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "kick_attack_1"):
		if(timer.is_stopped()):
			next_state = ground_state
		else:
			playback.travel("kick_attack_2")
			attack_face()
		
	if(anim_name == "kick_attack_2"):
		if(timer.is_stopped()):
			next_state = ground_state
		else:
			next_state = ground_state


func stamina_drain():
	var energy = Stamina.new()
	energy.energy_loss = stamina_loss  # lose stamina on every kick
	stamina_component.stamina_taken(energy)
	print(stamina_component.stamina)
	
	if(stamina_component.stamina <= 0):
		#next_state = rest_state
		pass
		
		
	 
	
