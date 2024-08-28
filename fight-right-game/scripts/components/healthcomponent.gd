extends Node2D
class_name HealthComponent

@export var Max_health : float = 100
var health : float

# Called when the node enters the scene tree for the first time.
func _ready():
	health = Max_health

#
func damage_taken(attack : Attack):
	health -= attack.attack_damage
	
	if health <= 0:
		get_parent().queue_free()
