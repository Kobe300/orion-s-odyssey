extends Area2D

var attack_damage : float = 10

@onready var player = get_node("/root/Game/Player/PlayerManager/Health")

func _on_body_entered(body):
	if body.has_method("damage_taken"):
		body.damage_taken(attack_damage)
		print('Damage Taken!')

## Use the same code as
