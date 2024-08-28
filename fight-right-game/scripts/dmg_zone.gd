extends Area2D

const dmg = 10.0
var damage : float = 10

@onready var player = get_node("/root/Game/Player/PlayerManager/Health")

#func _on_body_entered(body):
	#player.dmg_player(damage)
	#print('Damage Taken!')

func _on_body_entered(body):
	if body.has_method("damage_taken"):
		body.damage_taken(damage)
		print('Damage Taken!')
