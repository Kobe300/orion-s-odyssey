#class_name Ground
extends State

@export var jump_state: State
@export var attack_state: State
@export var chase_state: State

#@export var sprint_speed = 250.0
@export var JUMP_FORCE: float = -300.0

@onready var buffer_timer : Timer = $BuffferTimer

# Called when the node enters a state.
func enter():
	playback.travel("idle")

# Called when the node exit a state.
func exit(): 
	pass

func process_input(event: InputEvent):
	pass


func process_physics(delta: float):
	if (!character.is_on_floor() and buffer_timer.is_stopped()):
		next_state = jump_state
	
	if chase_state.player_chase:
		next_state = chase_state
