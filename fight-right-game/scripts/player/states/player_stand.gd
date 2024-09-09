#class_Name Stand
extends State

@export var ground_state : State

func enter():
	playback.travel("stand")
	#pass

func exit():
	pass

func process_input(event : InputEvent):
	pass

func process_physics(delta):
	pass

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "stand"):
		next_state = ground_state
