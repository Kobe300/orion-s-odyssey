#class_name Chase
extends State

var player_chase = false
var player = null
@export var ground_state: State
@export var roam_state: State

# Called when the node enters a state.
func enter():
	playback.travel("move")

# Called when the node exit a state.
func exit(): 
	pass

func process_input(event: InputEvent):
	pass


func process_physics(delta: float):
	if !player_chase:
		#should be roam state
		next_state = ground_state


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):  # Check if the body is a player
		player = body
	player_chase = true
	roam_state.is_roaming = false
	print('player found')


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):  # Make sure we're unsetting the player chase properly
		player = null
	player_chase = false
	roam_state.is_roaming = true
	print('player lost')
