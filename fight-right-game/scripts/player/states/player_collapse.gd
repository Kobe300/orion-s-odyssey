#class_Name Collapse
extends State

@export var rest_state: State

func enter():
	playback.travel("collapse")
	#pass

func exit():
	pass

func process_input(event : InputEvent):
	pass

func process_physics(delta):
	pass


func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "collapse"):
		next_state = rest_state
