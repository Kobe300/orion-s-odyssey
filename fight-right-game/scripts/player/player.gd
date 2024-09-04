#class_name Player
class_name Player
extends CharacterBody2D

@export var MOVESPEED : float = 150.0

@onready var bodysprite : Sprite2D = $PlayerSprites/BodySprite2D #Flip Player Sprite2D
@onready var fxsprite : Sprite2D = $PlayerSprites/FXSprite2D #Flip FX Sprite2D

@onready var sword : Node2D = $PlayerSprites/Sword #Flip Sword Node
@onready var sword_sprite_2d = $PlayerSprites/Sword/SwordSprite2D

@onready var animation_tree : AnimationTree = $AnimationTree 
@onready  var state_machine : StateMachine = $StateMachine 

@onready var player_health = $HealthComponent
@onready var player_attack = $AttackComponent

var script_path = self.get_script().resource_path
var script_name = script_path.get_file() 

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") # Get the gravity from the project settings to be synced with RigidBody nodes.
var direction :  Vector2 = Vector2.ZERO
var facing_direction : Vector2 = Vector2.RIGHT

func _ready():
	GlobalInv.player_ref(self)
	animation_tree.active = true #Ensures animation Tree is always active on game runtime


func _physics_process(delta: float):
	if !is_on_floor():
		velocity.y += gravity * delta #Add gravity
	
	# Get the input direction and handle the movement/deceleration.
	direction = Input.get_vector("left", "right", "up", "down") 	#controls Enemy Basic Movement 
	
	if state_machine.check_can_move():
		# Character Sprint
		if (Input.is_action_pressed("sprint")): 
			direction.x *= 2
			MOVESPEED = 200.0
		else:
			MOVESPEED = 125.0
			
		velocity.x = direction.x * MOVESPEED
	else:
		velocity.x = move_toward(velocity.x, 0, MOVESPEED)
	
	update_animation_parameters()
	update_player_direction()
	determine_face_direction()
	move_and_slide()
	#print(facing_direction)

func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position", direction.x)

#Deterimine the direction the player sprite and children are facing
func update_player_direction():
	if direction.x > 0:
		bodysprite.flip_h = false
		fxsprite.flip_h = false
		sword.scale.x = abs(sword.scale.x) 
		$HitBoxComponent.scale.x = 1
		$AttackComponent.scale.x = 1
	elif direction.x < 0:
		bodysprite.flip_h = true
		fxsprite.flip_h = true
		sword.scale.x = -abs(sword.scale.x)
		$HitBoxComponent.scale.x = -1
		$AttackComponent.scale.x = -1
	
#Determine tirection the player is facing
func determine_face_direction():
	if (direction == Vector2.ZERO):
		direction = facing_direction 
	elif (direction != Vector2.ZERO):
		facing_direction = direction

#Aplly Item Effect To Player
func apply_item_effect(item):
	match item["effect"]:
		"Stamina":
			MOVESPEED += 50
			print("Speed increased to ", MOVESPEED)
		"Slot Boost":
			GlobalInv.increase_inventory_size(5)
			print("Slots increased to ", GlobalInv.inventory.size())
		"Heal":
			player_health.health += 50
			print("Player Heal'd to = " + str(player_health.health))
		_:
			print("There is no effect for this item")

#Equip Items to Player
func equip_item(item):
	match item["type"]:
		"weapon":
			state.sword = true
			#print("sword is = to ", state.sword)
			sword.visible = true
			sword_sprite_2d.texture = item["texture"]
			#print("weapon equiped")
			#print(str(player_attack.attack_damage) + " before equipped")
			player_attack.attack_damage = player_attack.attack_damage + item["damage"]
			#print(str(player_attack.attack_damage) + " after equipped")
			print("equip_item is executed in script: " + str(script_name))

		_:
			print("There is no type for this item")

func unequip_item(item):
	match item["type"]:
		"weapon":
			state.sword = false
			print("sword is = to ", state.sword)
			sword.visible = false
			sword_sprite_2d.texture = item["texture"]
			print("weapon unequiped")
			player_attack.attack_damage = 30
		_:
			print("There is no type for this item")
