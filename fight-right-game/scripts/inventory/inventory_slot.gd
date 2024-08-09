extends Control

@onready var item_icon = $Inner/Item_Icon
@onready var quantity = $Inner/Quantity
@onready var info = $Info
@onready var item_name = $Info/Item_Name
@onready var item_type = $Info/Item_Type
@onready var item_effect = $Info/Item_Effect
@onready var action_panel = $Action_Panel

var item = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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
		action_panel.visible = false

func _on_use_pressed():
	action_panel.visible = false
	if item != null and item["effect"] != "":
		if GlobalInv.player_node:
			GlobalInv.player_node.apply_item_effect(item)
			GlobalInv.remove_item(item["type"], item["effect"])
		else:
			print("Player could not be found")
