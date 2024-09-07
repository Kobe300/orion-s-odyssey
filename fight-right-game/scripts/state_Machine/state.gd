extends Node

class_name State

@export var stamina_component : StaminaComponent
@export var stamina_loss: float 

@export var can_move : bool = true
var sword : bool = false #temporary varible put on players
var  kick : bool = false #temporary variable put on players

var animation_name : String
var character : CharacterBody2D
var playback : AnimationNodeStateMachinePlayback
var next_state : State


func enter():
	playback.travel(animation_name)
	#pass

func exit():
	pass
	
func process_input(event : InputEvent):
	pass

func process_physics(delta):
	pass


func attack_face():		
	var new_position = character.global_position + Vector2(character.direction.x * 2, 0)  # Calculate the new position based on the direction and a speed factor (5 in this case)
	character.global_position = new_position # Instantly move the character to the new position
#character.velocity.x = character.direction.x * 5
#character.move_and_slide()

func stamina_drain():
	var energy = Stamina.new()
	energy.energy_loss = stamina_loss  # lose stamina on every kick
	stamina_component.stamina_taken(energy)
	print(stamina_component.stamina)
	
	if(stamina_component.stamina <= 0):
		#next_state = rest_state
		pass
		

func stamina_gain():
	var energy = Stamina.new()
	energy.energy_loss = stamina_loss  # lose stamina on every kick
	stamina_component.stamina_taken(energy)
	print(stamina_component.stamina)
	
	if(stamina_component.stamina <= 0):
		#next_state = rest_state
		pass
