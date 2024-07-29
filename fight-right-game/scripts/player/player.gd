#class_name Player

class_name Player
extends CharacterBody2D


@onready 
var animations = $PlayerAnimations #getnode("playerAnimations")
@onready 
var state_machine = $StateMachine #getnode("state_machine")

func _ready() -> void:
	state_machine.init(self)  #Initialize the statemachine


func _unhandled_input(event: InputEvent) -> void:
	state_machine.Process_Input(event)


func _physics_process(delta: float) -> void:
	state_machine.Process_Physics(delta)


func _process_input(delta: float) -> void:
	state_machine.Process_Frame(delta)


