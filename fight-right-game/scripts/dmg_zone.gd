extends Area2D

var attack_damage : float = 10
var knock_back_force : float = 100

func _on_body_entered(body):
	if body.has_method("damage_taken"):
		var attack = Attack.new()
		attack.attack_damage = attack_damage
		attack.knock_back_force = knock_back_force
		attack.attack_position = global_position
		body.damage_taken(attack)
		print('Damage Taken!')

## Use the same code as
