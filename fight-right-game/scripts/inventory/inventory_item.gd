@tool
extends Node2D

@export var item_type = ""
@export var item_name = ""
@export var item_effect = ""
@export var item_texture = Texture

var scene_path: String = "res://scenes/inventory_item.tscn"

@onready var icon_sprite = $Sprite2D

var player_in_range = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if not Engine.is_editor_hint():
		icon_sprite.texture = item_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if not Engine.is_editor_hint():
		icon_sprite.texture = item_texture
	
	#if Input.is_action_just_pressed("interact"):
	print('you interacted')
	
	if player_in_range and Input.is_action_just_pressed("interact"):
		print('in range')
		pickup_item()

func pickup_item():
	var item = {
		"quantity": 1,
		"type": item_type,
		"name": item_name,
		"effect": item_effect,
		"texture": item_texture,
		"path": scene_path
	}
	
	if GlobalInv.player_node:
		GlobalInv.add_item(item)
		self.queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		player_in_range = true
		print(player_in_range)


func _on_area_2d_body_exited(body):
	if body.is_in_group("Player"):
		player_in_range = false
		print(player_in_range)
