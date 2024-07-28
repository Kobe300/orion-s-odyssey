@tool # Allows the script to run in the editor
extends Node3D # Extends the Node3D class to use 3D features

@export_node_path var planet_path # Exports a node path for the planet so it can be set in the editor

@export var timeOfDay : float # Exports a float variable for the time of day
@export var sunDst : float = 1.0 # Exports a float variable for the distance of the sun with a default value of 1.0
@export var timeSpeed : float = 0.01 # Exports a float variable for the speed of time with a default value of 0.01

@onready var _planet : Node3D = get_node(planet_path) # Initializes the _planet variable with the node specified by planet_path when the scene is ready

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not Engine.is_editor_hint(): # Checks if the script is not running in the editor
		timeOfDay += delta * timeSpeed # Increments the timeOfDay by delta time multiplied by timeSpeed
		global_transform.origin = Vector3(cos(timeOfDay), sin(timeOfDay), 0) * sunDst # Sets the global position of the sun based on timeOfDay and sunDst
		var planet_to_sun = (self.global_position - _planet.global_position).normalized() # Calculates the normalized direction from the planet to the sun
		var up_vector = Vector3(-planet_to_sun.y, planet_to_sun.x, 0.0) # Creates an up vector perpendicular to the direction of planet_to_sun
		look_at(_planet.global_position, up_vector) # Rotates the sun to face the planet using the up_vector
