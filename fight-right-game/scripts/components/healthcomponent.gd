extends Node2D
class_name HealthComponent

@export var damage_taken_text : PackedScene
@export var Max_health : float = 100
var health : float

# Called when the node enters the scene tree for the first time.
func _ready():
	health = Max_health

#
func damage_taken(attack : Attack):
	print_damage(attack.attack_damage)
	
	# Handles Health Loss
	health -= attack.attack_damage
	
	if health <= 0:
		get_parent().queue_free()
	print(str(get_parent().name) + " health is " + str(health))


func print_damage(amount):
	var damage = damage_taken_text.instantiate() # instantiate damage text scene in scene of damaged 
	damage.find_child("Label").text = str(amount) # find Label Node in scene and adjust to text equal amount
	damage.position = get_parent().position # instantiated positon will be the position of position of Node
	get_tree().current_scene.add_child(damage)
	
	print(str(amount) + " of health lost by " + str(get_parent().name))
