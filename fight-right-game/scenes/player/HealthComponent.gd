extends Node2D

@export var Max_health : float = 100
var health : float

# Called when the node enters the scene tree for the first time.
func _ready():
	health = Max_health
	pass # Replace with function body.

func damage(attack : Attack):
	health -= attack.attack_damage
	
	if health <= 0:
		get_parent().queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
