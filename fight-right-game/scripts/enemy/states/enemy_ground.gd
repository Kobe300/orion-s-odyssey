#class_name Ground
extends State

@export var jump_state: State
@export var attack_state: State

#@export var sprint_speed = 250.0
@export var JUMP_FORCE: float = -300.0

@onready var inventory_ui = $"../../InventoryUI"
@onready var buffer_timer : Timer = $BuffferTimer



# Called when the node enters a state.
func enter():
	playback.travel("move")
	print('Character in Ground State')
	#pass
# Called when the node exit a state.
func exit(): 
	pass

func process_input(event: InputEvent):
	# Open inventory
	if Input.is_action_just_pressed("inventory"):
		inventory_ui.visible = !inventory_ui.visible
		get_tree().paused = !get_tree().paused
		
	# Character Jumps
	if (Input.is_action_just_pressed("jump")): 
		character.velocity.y = JUMP_FORCE
		next_state = jump_state
	
	# Character Attacks
	if (Input.is_action_just_pressed("attack")): 
		next_state = attack_state

#
func process_physics(delta: float):
	if (!character.is_on_floor() and buffer_timer.is_stopped()):
		next_state = jump_state
