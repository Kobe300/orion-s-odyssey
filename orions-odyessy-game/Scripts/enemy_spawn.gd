extends Node3D

@onready var main = get_tree().current_scene
var Enemy = load("res://Scenes/enemy.tscn") # Preload the enemy scene for instantiation

# Function to spawn an enemy at a random position within a specific range
func spawn():
	var enemy = Enemy.instantiate() # Instantiate a new enemy
	main.add_child(enemy) # Add the newly created enemy to the current scene
	enemy.transform.origin = transform.origin + Vector3(randf_range(-15,15), randf_range(-10,10), 0)  # Set the position of the new enemy to a random location near the current node


func _on_timer_timeout():
	spawn()
