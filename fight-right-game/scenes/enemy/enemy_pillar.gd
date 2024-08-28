extends CharacterBody2D

@export var damage_taken_text : PackedScene
var health : float = 100

func damage_taken(attack: Attack):
	print_damage(attack.attack_damage)
	
	# Handles Health Loss
	health -= attack.attack_damage
	
	if health <= 0:
		queue_free()
	print("pillar health is " + str(health ))
	
	# Handles Enemy Knockback
	velocity = (global_position - attack.attack_position).normalized()*attack.knock_back_force
	
	
func print_damage(amount):
	var damage = damage_taken_text.instantiate() # instantiate damage text scene in scene of damaged 
	damage.find_child("Label").text = str(amount) # find Label Node in scene and adjust to text equal amount
	damage.position = position # instantiated positon will be the position of position of Node
	get_tree().current_scene.add_child(damage)
	
	
	
	print(str(amount) + " lost by pillar")
