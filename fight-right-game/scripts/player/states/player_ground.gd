#class_name Ground
extends State

@export var jump_state: State
#@export var SPRINTSPPED = 250.0
@export var JUMP_FORCE: float = -300.0
@export var jump_animation : String = "jump"


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
		print('Character Jump')

#
func _process_physics(delta: float) -> State:
	return null

func jump():
	character.velocity.y = JUMP_FORCE

	next_state = jump_state
	playback.travel(jump_animation)
