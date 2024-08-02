#class_name Ground
extends State

@export var jump_state: State

#@export var sprint_speed = 250.0
@export var JUMP_FORCE: float = -300.0



# Called when the node enters a state.
func enter():
	pass
	#parent.animations.play("Run")

# Called when the node exit a state.
func exit():
	pass

func process_input(event: InputEvent):
	if (Input.is_action_just_pressed("jump")): 
		jump()

#
func process_physics(delta: float):
	if (!character.is_on_floor()):
		next_state = jump_state
	

func jump():
	character.velocity.y = JUMP_FORCE

	next_state = jump_state
	playback.travel("jump")
