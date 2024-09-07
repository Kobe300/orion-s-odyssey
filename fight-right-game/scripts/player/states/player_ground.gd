#class_name Ground
extends State

@export var jump_state: State
@export var sword_state: State
@export var melee_state: State
@export var kick_state: State

#@export var sprint_speed = 250.0
@export var JUMP_FORCE: float = -300.0

@onready var inventory_ui = $"../../InventoryUI"
@onready var buffer_timer : Timer = $BuffferTimer



# Called when the node enters a state.
func enter():
	playback.travel("move")
	#print('Character in Ground State')
	#pass

# Called when the node exit a state.
func exit(): 
	pass

func process_input(event: InputEvent):
	if Input.is_action_pressed("sprint"):
		stamina_drain()
	
	# Open inventory
	if Input.is_action_just_pressed("inventory"):
		inventory_ui.visible = !inventory_ui.visible
		
	# Character Jumps
	if (Input.is_action_just_pressed("jump")): 
		character.velocity.y = JUMP_FORCE
		next_state = jump_state
	
	# Character Attacks
	if (Input.is_action_just_pressed("attack")): 
		if state.sword:
			next_state = sword_state
		elif not state.sword:
			next_state = melee_state

	# Character Kicks
	if (Input.is_action_just_pressed("kick")): 
		next_state = kick_state
#
func process_physics(delta: float):
	#print(state.sword)
	if (!character.is_on_floor()):
		next_state = jump_state
