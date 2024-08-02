#class_name Attack
extends State

@onready var player = $"../.."

@export var ground_state: State

# Called when the node enters a state.
func enter() -> void:
	#player.direction.x = 0.0
	print('Character in Attack State')
	print(player.direction.x)
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
	#if(character.is_on_floor()):
		#next_state = ground_state	
		#pass
	pass
 
# Execute when animation is finished
func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "attack_1"):
		next_state = ground_state
	print(anim_name)
	#pass # Replace with function body.
