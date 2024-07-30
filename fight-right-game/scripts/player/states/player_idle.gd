#class_name Idle

extends State

@export var fall_state: State
@export var jump_state: State
@export var move_state: State
@export var attack_state: State

@onready var inventory_ui = $"../../InventoryUI"


# Called when the node enters a state.
func Enter() -> void:
	parent.animations.play("Idle")
	super()
	parent.velocity.x = 0

# Called when the node exit a state.
func Exit():
	pass

# Called to receives events from the `_unhandled_input()` callback.
func Process_Input(_event: InputEvent) -> State:

	if Input.is_action_just_pressed("jump") and parent.is_on_floor():	 # Handle jump.
		return jump_state
		
	if Input.get_axis("walk_left", "walk_right"):
		return move_state

	if Input.is_action_just_pressed("inventory"):
		inventory_ui.visible = !inventory_ui.visible
		get_tree().paused = !get_tree().paused
	

	if Input.is_action_just_pressed("attack_1") and parent.is_on_floor(): 	# Handle attack.
		return attack_state
		
	return null

# Corrisponds with the _physics_process() in "state_machine" script
func Process_Frame(delta: float) -> State:
	return null

func Process_Physics(delta: float):
	# Add the gravity.
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if not parent.is_on_floor():
		return fall_state
	
	return null

