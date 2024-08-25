#class_name Melee
extends Attack

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
	pass

#Corrisponds with the _physics_process() in "state_machine" script
func process_physics(delta: float):
	pass
 
# Execute when animation is finished
func _on_animation_tree_animation_finished(anim_name):
		if(anim_name == "melee_attack_1"):
			if(timer.is_stopped()):
				next_state = ground_state
			else:
				playback.travel("melee_attack_2")
		
		if(anim_name == "melee_attack_2"):
			if(timer.is_stopped()):
				next_state = ground_state
			else:
				playback.travel("melee_attack_3")
		
		if(anim_name == "melee_attack_3"):
			if(timer.is_stopped()):
				next_state = ground_state
			else:
				next_state = ground_state

func attack_face():		
	var new_position = character.global_position + Vector2(character.direction.x * 15, 0)  # Calculate the new position based on the direction and a speed factor (5 in this case)
	character.global_position = new_position # Instantly move the character to the new position
	#character.velocity.x = character.direction.x * 5
	#character.move_and_slide()

