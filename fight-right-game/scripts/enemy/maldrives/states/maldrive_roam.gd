# class_name Roam
extends State

@export var ground_state: State
@export var chase: State
@export var group_name: String

var positions: Array
var temp_position: Array
var curr_position: Marker2D

var is_roaming = false

# Called when the node enters a state.
func enter() -> void:
	playback.travel("move")
	positions = get_tree().get_nodes_in_group(group_name)
	_get_positions()
	_get_next_position()

# Called when the node exits a state.
func exit():
	pass

# Called every frame, the enemy will move towards the current position.
func process_physics(delta: float):
	if !is_roaming:
		next_state = ground_state
		return

func _get_positions():
	temp_position = positions.duplicate()
	temp_position.shuffle()

func _get_next_position():
	if temp_position.is_empty():
		_get_positions()
	curr_position = temp_position.pop_front()
