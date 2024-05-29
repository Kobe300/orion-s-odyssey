extends CharacterBody3D

var speed = randf_range(20,50)

func _physics_process(delta):
	set_velocity(Vector3(0,0,speed)) # Set the velocity of the object to a vector with z-component equal to speed
	move_and_slide()
	
	if transform.origin.z > 10:
		queue_free()  # Free the node from the scene tree
