#class_Name Rest
extends State

@export var stand_state : State

func enter():
	playback.travel("rest")
	#pass

func exit():
	pass

func process_input(event : InputEvent):
	pass

func process_physics(delta):
	stamina_gain()
	
	if (stamina_component.stamina == stamina_component.Max_stamina):
		next_state = stand_state
