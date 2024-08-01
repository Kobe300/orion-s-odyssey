#class_name Idle

extends State

@export var fall_state: State
@export var jump_state: State
@export var move_state: State
@export var attack_state: State

@onready var inventory_ui = $"../../InventoryUI"


# Called when the node enters a state.
func enter() -> void:
	pass

# Called when the node exit a state.
func exit():
	pass

# Called to receives events from the `_unhandled_input()` callback.
func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump") and character.is_on_floor():	 # Handle jump.
		return jump_state
		
	if Input.get_axis("left", "right"):
		return move_state

	if Input.is_action_just_pressed("inventory"):
		inventory_ui.visible = !inventory_ui.visible
		get_tree().paused = !get_tree().paused
	

	if Input.is_action_just_pressed("attack_1") and character.is_on_floor(): 	# Handle attack.
		return attack_state
		
	return null

func process_physics(delta: float):
	# Add the gravity.
	#character.velocity.y += gravity * delta
	character.move_and_slide()
	
	if not character.is_on_floor():
		return fall_state
	
	return null

