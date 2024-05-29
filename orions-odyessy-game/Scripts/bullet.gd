extends CharacterBody3D

var bulletVelocity = 50
var explosion = load("res://Scenes/explosion_particles.tscn")
@onready var main = get_tree().current_scene
@onready var explodeSound = $EnemyExplode

func _physics_process(delta):
	set_velocity(Vector3(0,0,-bulletVelocity))
	move_and_slide()

func _on_area_3d_body_entered(body):
	if body.is_in_group("Enemies"):
		var particles = explosion.instantiate()
		main.add_child(particles)
		particles.transform.origin = transform.origin
		body.queue_free()
		explodeSound.play()
		visible = false
		$Area3D/CollisionShape3D.call_deferred("set_disabled", true)
	

func _on_LightTimer_timeout():
	$OmniLight3D.visible = false



