extends Node

var attack_damage : float = 20

func _on_body_entered(body):
	if body.has_method("damage_taken"):
		body.damage_taken(attack_damage)
