#class_name Move

extends State

@export var idle_state: State
@export var attack_state: State
@export var jump_state: State
@export var fall_state: State


# Called when the node enters a state.
#func Enter():
	#return null

# Called when the node exit a state.
func Exit():
	pass

func Process_Input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('jump') and parent.is_on_floor():
		return jump_state
	return null

 # Corrisponds with the _physics_process() in "state_machine" script
func Process_Frame(delta: float) -> State:
	return null

func Process_Physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	var movement = Input.get_axis("walk_left", "walk_right") * MOVESPEED
	
	if movement == 0:
		return idle_state
	
	parent.animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null


