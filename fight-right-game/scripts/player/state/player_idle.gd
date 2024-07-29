extends State

@export var fall_state: State
@export var jump_state: State
@export var move_state: State


# Called when the node enters a state.
func enter() -> void:
	super()
	parent.velocity.x = 0


# Called to receives events from the `_unhandled_input()` callback.
func handle_input(_event: InputEvent) -> void:
	pass


func update(delta: float):
	pass



func _physicsUpdate(delta: float):
	pass


# Called when the node exit a state.
func exit():
	pass
