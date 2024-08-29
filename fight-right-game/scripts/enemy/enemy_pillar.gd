extends CharacterBody2D

@export var damage_taken_text : PackedScene
@export var attack_damage : float = 50

func _on_attack_component_area_entered(area: Area2D) -> void:
	print("Area entered:", area)
	if area is HitBoxComponent:
		var hitbox : HitBoxComponent = area
		
		var attack = Attack.new()
		attack.attack_damage = attack_damage
		#attack.knock_back_force = knock_back_force
		#attack.attack_position = global_position
		
		area.damage(attack)
		print(str(name) + " Dealt " + str(attack_damage) + " to " + str(hitbox.get_parent().name))
	
	else:
		print("Entered area is not a HitBoxComponent")
