extends Node2D
class_name StaminaComponent

@export var Max_stamina : float = 100
var stamina : float

# Called when the node enters the scene tree for the first time.
func _ready():
	stamina = Max_stamina

#
func stamina_taken(energy: Stamina):
	#print(energy.stamina_loss)
	# Handles stamina Loss
	stamina-= energy.stamina_loss
	
	if stamina <= 0:
		#Activate Rest State
		#get_parent().queue_free()
		pass
		
	#print(str(get_parent().name) + "stamina is " + str(stamina))


func stamina_regen(energy: Stamina):
	#print(energy.stamina)
	# Handles stamina Gain
	if stamina == Max_stamina:
		return
	
	#Enter ground Stated
	return
