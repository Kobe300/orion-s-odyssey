extends Node

var PLAYER_HEALTH = 100.0

func dmg_player(dmg):
	PLAYER_HEALTH -= dmg
	print("Health = " + str(PLAYER_HEALTH))

func heal_player(heal):
	PLAYER_HEALTH += heal
	print("Player Healed to " + str(PLAYER_HEALTH))
