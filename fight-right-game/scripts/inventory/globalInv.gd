extends Node

var inventory = []
var player_node = null

signal inventory_updated

@onready var inventory_slot_scene = preload("res://scenes/inventory_slot.tscn")

func _ready():
	inventory.resize(30)

func add_item(item):
	for i in range(inventory.size()):
		if inventory[i] != null and inventory[i]["type"] == item["type"] and inventory[i]["effect"] == item["effect"]:
			inventory[i]["quantity"] += item["quantity"]
			inventory_updated.emit()
			print("Item added", inventory)
			return true
		elif inventory[i] == null:
			inventory[i] = item
			inventory_updated.emit()
			print("Item added", inventory)
			return true
	return false

func remove_item(item_type, item_effect):
	for i in range(inventory.size()):
		if inventory[i] != null and inventory[i]["type"] == item_type and inventory[i]["effect"] == item_effect:
			inventory[i]["quantity"] -= 1
			if inventory[i] <= 0:
				inventory[i] = null
			inventory_updated.emit()
			return true
	return false

func inv_size_updated():
	inventory_updated.emit()

func player_ref(player):
	player_node = player
	print(player_node)
