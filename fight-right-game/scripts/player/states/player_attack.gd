#class_name Attack
extends State

class_name Attack

@export var ground_state : State
@export var sword_state : Attack
@export var melee_state : Attack

@onready var timer : Timer = $AttackTimer

# Called when the node enters a state.
func enter():
	pass

# Called when the node exit a state.
func exit() -> void:
	print(" Exit Attack State")
	pass

# Corrisponds with the _process() in "state_machine" script
func process_input(event: InputEvent):
	pass
		

#Corrisponds with the _physics_process() in "state_machine" script
func process_physics(delta: float):
	if sword:
		next_state = sword_state
	elif not sword:
		next_state = melee_state
	
