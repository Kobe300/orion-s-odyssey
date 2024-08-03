#class_name Attack
extends State

@export var ground_state : State

# Called when the node enters a state.
func enter():
	playback.travel("attack_1")
	print('Character in Attack State')
	print(character.direction.x)
	attack_face()
	#pass

# Called when the node exit a state.
func exit() -> void:
	#playback.travel("move")
	print(" Exit Attack State")

# Corrisponds with the _process() in "state_machine" script
func process_input(event: InputEvent):
	pass

#Corrisponds with the _physics_process() in "state_machine" script
func process_physics(delta: float):
	print(character.facing_direction )
	pass
 
# Execute when animation is finished
func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "attack_1"):
		next_state = ground_state
	print(anim_name)
	#pass # Replace with function body.


func attack_face():		
	var new_position = character.global_position + Vector2(character.direction.x * 15, 0)  # Calculate the new position based on the direction and a speed factor (5 in this case)
	character.global_position = new_position # Instantly move the character to the new position
	#character.velocity.x = character.direction.x * 5
	#character.move_local_x(character.velocity.x)
	#character.move_and_slide()
