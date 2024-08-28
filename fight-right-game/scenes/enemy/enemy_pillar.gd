extends CharacterBody2D

@export var damage_taken_text : PackedScene

func damage_taken(amount):
	var damage = damage_taken_text.instantiate() # instantiate damage text scene in scene of damaged 
	damage.find_child("Label").text = str(amount) # find Label Node in scene and adjust to text equal amount
	damage.position = position # instantiated positon will be the position of position of Node
	get_tree().current_scene.add_child(damage)
	
	print(amount)
	

