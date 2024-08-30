extends Node

var inventory = []
var player_node = null

signal inventory_updated

@onready var inventory_slot_scene = preload("res://scenes/inventory_slot.tscn")

var hotbar_size = 4
var hotbar_inventory = []

func _ready():
	inventory.resize(16)
	hotbar_inventory.resize(hotbar_size)

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
			if inventory[i]["quantity"] <= 0:
				inventory[i] = null
			inventory_updated.emit()
			return true
	return false

func remove_item_from_inventory(item_type, item_effect):
	for i in range(inventory.size()):
		if inventory[i] != null and inventory[i]["type"] == item_type and inventory[i]["effect"] == item_effect:
			inventory[i] = null
			inventory_updated.emit()
			return true
	return false

func inv_size_updated():
	inventory_updated.emit()

func player_ref(player):
	player_node = player
	print(player_node)

func adjust_drop_position(position):
	var radius = 50
	var nearby_items = get_tree().get_nodes_in_group("Items")
	for item in nearby_items:
		if item.global_position.distance_to(position) < radius:
			var random_offset = Vector2(randf_range(-radius, radius), 0)
			position += random_offset
			break
	return position

# Drops an item at a specified position, adjusting for nearby items
func drop_item(item_data, drop_position):
	var item_scene = load(item_data["path"])
	var item_instance = item_scene.instantiate()
	item_instance.set_item_data(item_data)
	drop_position = adjust_drop_position(player_node.global_position)
	item_instance.global_position = drop_position
	get_tree().current_scene.add_child(item_instance)

# Hotbar Code
func add_hotbar_item(item):
	var slot_index := -1

	# Determine the slot based on the item type
	match item["type"]:
		"weapon":
			slot_index = 0 # Example: weapons go into slot 0
		"gauntlet":
			slot_index = 1 # Example: skills go into slot 1
		"bow":
			slot_index = 2 # Example: potions go into slot 2
		"gems":
			slot_index = 3 # Example: potions go into slot 2
		_:
			slot_index = -1 # Default case

	# Check if the determined slot is valid and assign the item
	if slot_index != -1:
		# If there's already an item in the slot, unequip and move it back to inventory
		if hotbar_inventory[slot_index] != null:
			var old_item = hotbar_inventory[slot_index]
			GlobalInv.player_node.unequip_item(old_item)
			GlobalInv.add_item(old_item) # Add the old item back to the inventory

		# Equip the new item in the slot
		hotbar_inventory[slot_index] = item
		GlobalInv.player_node.equip_item(item) # Equip the new item
		inventory_updated.emit()
		return true
	else:
		print("No available slot or slot already occupied")
		return false


func remove_hotbar_item(item_type, item_effect):
	for i in range(hotbar_inventory.size()):
		if hotbar_inventory[i] != null and hotbar_inventory[i]["type"] == item_type and hotbar_inventory[i]["effect"] == item_effect:
			hotbar_inventory[i] = null
			inventory_updated.emit()
			return true
	return false

func unassign_hotbar_item(item_type, item_effect):
	for i in range(hotbar_inventory.size()):
		if hotbar_inventory[i] != null and hotbar_inventory[i]["type"] == item_type and hotbar_inventory[i]["effect"] == item_effect:
			hotbar_inventory[i] = null
			inventory_updated.emit()
			return true
	return false

func is_item_assigned_to_hotbar(item_to_check):
	return item_to_check in hotbar_inventory
