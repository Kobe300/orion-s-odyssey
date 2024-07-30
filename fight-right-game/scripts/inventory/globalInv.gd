extends Node

var inventory = []
var player_node = null

signal inventory_updated

func _ready():
	inventory.resize(30)

func add_item(item):
	for i in range(inventory.size()):
		if inventory[i] != null and inventory[i]["type"] == item["type"] and inventory[i]["effect"] == item["effect"]:
			inventory[i]["quantity"] += item["quantity"]
			inventory_updated.emit()
			print('item added ', inventory[i])
			return true
		elif inventory[i] == null:
			inventory[i] = item
			inventory_updated.emit()
			print('new item added ', inventory[i])
			return true
		return false

func remove_item():
	inventory_updated.emit()

func inv_size_updated():
	inventory_updated.emit()

func player_ref(player):
	player_node = player
	print(player_node)
