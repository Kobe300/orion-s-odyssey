class_name Player
extends CharacterBody2D


@onready var animations = $animations #getnode("animations")
@onready var state_machine = $state_machine #getnode("state_machine")

func ready() -> void:
	state_machine.init(self)  #Initialize the statemachine
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process_input(delta: float) -> void:
	state_machine.process_frame(delta)
