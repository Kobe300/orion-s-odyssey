extends Area2D
class_name HitBoxComponent

@export var health_component : HealthComponent

func hit(attack : Attack):
	if health_component:
		health_component.damage_taken(attack)
		#print("hit box fucntion is executing")
		state.hurt = true
