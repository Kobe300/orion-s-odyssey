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
		stamina = 0
		pass
	print(str(get_parent()) + "stamina is " + str(stamina))


func stamina_regen(energy: Stamina):
	#Handles Stamina Gain
	stamina += energy.energy_gain
	
	if stamina >= Max_stamina:
		stamina = Max_stamina
	
