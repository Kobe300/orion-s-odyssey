extends Node
class_name HitBoxComponent

@export var health_component: HealthComponent

func damage_taken(attack : Attack):
	if health_component:
		health_component.damage_taken(attack)
