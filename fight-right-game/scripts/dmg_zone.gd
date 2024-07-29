extends Area2D

const dmg = 10.0

@onready var player

func _ready():
	player = get_node("/root/Game/Player/PlayerManager/Health")

func _on_body_entered(body):
	player.dmg_player(dmg);
	print("Player Current Health = " + str(body.PLAYER_HEALTH))
	print('Damage Taken!')


