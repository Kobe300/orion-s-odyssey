extends Control

@onready var item_icon = $Inner/Item_Icon
@onready var quantity = $Inner/Quantity
@onready var info = $Info
@onready var item_name = $Info/Item_Name
@onready var item_type = $Info/Item_Type
@onready var item_effect = $Info/Item_Effect
@onready var action_panel = $Action_Panel
@onready var unequip_buttom = $Action_Panel/unequip
@onready var use_button = $Action_Panel/Use

var item = null
var slot_index = -1
var is_assigned = false

# Setting slot index
func set_slot_index(new_index):
	slot_index = new_index
	

func set_empty():
	item_icon.texture = null
	quantity.text = ""

func set_item(new_item):
	item = new_item
	item_icon.texture = item["texture"]
	quantity.text = str(item["quantity"])
	item_name.text = str(item["name"])
	item_type.text = str(item["type"])
	if item["effect"] != null:
		item_effect.text = str("+ ", item["effect"])
	else:
		item_effect.text = ""
	update_assignment_status()

func _on_button_mouse_entered():
	if item != null:
		action_panel.visible = false
		info.visible = true

func _on_button_mouse_exited():
	info.visible = false

func _on_button_pressed():
	if item != null:
		info.visible = false
		action_panel.visible = !action_panel.visible

func _on_drop_pressed():
	if item != null:
		var drop_position = GlobalInv.player_node.global_position
		var drop_offset = Vector2(0, 50)
		drop_offset = drop_offset.rotated(GlobalInv.player_node.rotation)
		GlobalInv.drop_item(item, drop_position + drop_offset)
		GlobalInv.remove_item(item["type"], item["effect"])
		GlobalInv.player_node.unequip_item(item)
		GlobalInv.remove_hotbar_item(item["type"], item["effect"])
		action_panel.visible = false

func _on_use_pressed():
	action_panel.visible = false
	if item["type"] == "weapon" or item["type"] == "gauntlet" or item["type"] == "gems" or item["type"] == "bow":
		if GlobalInv.player_node:
			GlobalInv.player_node.equip_item(item)
			is_assigned = true
			GlobalInv.remove_item_from_inventory(item["type"], item["effect"])
			GlobalInv.add_hotbar_item(item)
		else:
			print("Player could not be found")
		update_assignment_status()
	else:
		if item != null and item["effect"] != "":
			if GlobalInv.player_node:
				GlobalInv.player_node.apply_item_effect(item)
				GlobalInv.remove_item(item["type"], item["effect"])
			else:
				print("Player could not be found")

# Updates assignment status
func update_assignment_status():
	is_assigned = GlobalInv.is_item_assigned_to_hotbar(item)
	if is_assigned:
		unequip_buttom.visible = true
		use_button.visible = false
	else:
		unequip_buttom.visible = false
		use_button.visible = true


func _on_unequip_pressed() -> void:
	action_panel.visible = false
	if item != null and item["effect"] != "":
		is_assigned = false
		GlobalInv.player_node.unequip_item(item)
		GlobalInv.unassign_hotbar_item(item["type"], item["effect"])
		print('unequipping')
		GlobalInv.remove_item_from_inventory(item["type"], item["effect"])
		GlobalInv.remove_hotbar_item(item["type"], item["effect"])
		GlobalInv.add_item(item)
