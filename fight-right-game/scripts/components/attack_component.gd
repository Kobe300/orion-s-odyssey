extends Area2D

@export var attack_damage : float = 20
@export var kick_damage : float = 30
@export var state_machine : StateMachine 


func _on_area_entered(area: Area2D) -> void:
	print("Area entered:", area)
	if area is HitBoxComponent:
		var hitbox : HitBoxComponent = area
		var attack = Attack.new()
	
		if state.kick:
			attack.attack_damage = kick_damage  # Use kick damage
			
		else:
			attack.attack_damage = attack_damage
		##attack.knock_back_force = knock_back_force
		##attack.attack_position = global_position

		area.hit(attack)
		#print(str(name) + " Dealt " + str(attack_damage) + " to " + str(hitbox.get_parent().name))
		#print(str(area.name))
		
	else:
		print("Entered area is not a HitBoxComponent")
