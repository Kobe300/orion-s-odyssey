#class_Name Kick
extends State

@export var ground_state : State

@onready var timer : Timer = $Timer

func enter():
	playback.travel("hurt_1")
	timer.start()
	attack_face(-5)
	print()
	#pass

func exit():
	state.hurt = false
	#pass
	
func process_input(event : InputEvent):
	pass


func process_physics(delta):
	pass

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "hurt_1"):
		if(timer.is_stopped()):
			next_state = ground_state
		else:
			playback.travel("hurt_2")
			attack_face(-5)
		
	if(anim_name == "hurt_2"):
		if(timer.is_stopped()):
			next_state = ground_state
		else:
			next_state = ground_state
