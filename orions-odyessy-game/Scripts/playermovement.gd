extends CharacterBody3D

const maxSpeed = 20
const acceleration = 0.75
var inputVector = Vector3()
var origin_position = Vector3.ZERO # Original position of the character
var cooldown = 0
const COOLDOWN = 8

@onready var guns = [$gun0, $gun1]
@onready var main = get_tree().current_scene
var Bullet = load("res://Scenes/bullet.tscn")

func _physics_process(delta):
	# Get the input vector based on user input
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	
	if inputVector == Vector3.ZERO:
		inputVector = (origin_position - global_transform.origin).normalized()
	else:
		inputVector = inputVector.normalized() # Normalize the input vector to ensure uniform speed in all directions
	
	# Adjust the character's velocity towards the target speed based on user input
	velocity.x = move_toward(velocity.x, inputVector.x * maxSpeed, acceleration)
	velocity.y = move_toward(velocity.y, inputVector.y * maxSpeed, acceleration)
	
	# Apply rotations based on velocity
	rotation_degrees.z = velocity.x * -2
	rotation_degrees.x = velocity.y / 2
	rotation_degrees.y = -velocity.x / 2
	
	#set_velocity(Vector3(0,0,maxSpeed)) #Moves the characters 
	move_and_slide() # Move the character and handle collisions
	
	#Clamps Character to a set place with the screen
	transform.origin.x = clamp(transform.origin.x, -15, 15)
	transform.origin.y = clamp(transform.origin.y, -10, 10)
	
	#Handles player shooting
	if Input.is_action_pressed("ui_accept") and cooldown <= 0:
		cooldown = COOLDOWN * delta
		for i in guns:
			var bullet = Bullet.instantiate()
			main.add_child(bullet)
			bullet.transform = i.global_transform
			bullet.velocity = bullet.transform.basis.z * 0600
			
	#cooldown
	if cooldown > 0:
		cooldown -= delta
