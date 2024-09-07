extends Node2D
class_name StaminaComponent

@export var Max_stamina : float = 100
var stamina : float

# Called when the node enters the scene tree for the first time.
func _ready():
	stamina = Max_stamina

#
func stamina_taken(energy: Stamina):
	# Handles staminaLoss
	stamina -= energy.energy_loss
	
	if stamina <= 0:
		get_parent().queue_free()
	print(str(get_parent()) + "stamina is " + str(stamina))
