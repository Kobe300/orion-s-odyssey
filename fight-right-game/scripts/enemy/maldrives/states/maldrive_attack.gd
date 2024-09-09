#class_name Attack
extends State

@export var ground_state : State

@onready var timer : Timer = $AttackTimer

# Called when the node enters a state.
func enter():
	playback.travel("sword_attack_1")
	timer.start()
	#print('Enemy in Attack State')
	attack_face(2)
	#pass

# Called when the node exit a state.
func exit() -> void:
	#print(" Enemy Exit Attack State")
	pass

# Corrisponds with the _process() in "state_machine" script
func process_input(event: InputEvent):
	pass

#Corrisponds with the _physics_process() in "state_machine" script
func process_physics(delta: float):
	pass
 
# Execute when animation is finished
func _on_animation_tree_animation_finished(anim_name):
	next_state = ground_state 
