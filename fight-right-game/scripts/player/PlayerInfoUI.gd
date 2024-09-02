extends Control

@onready var healthbar = $Health/Healthbar
@onready var essencebar = $Essence/EssenceBar
@export var health_component : HealthComponent

func _ready():
	healthbar.max_value = health_component.Max_health
	healthbar.value = healthbar.max_value
	print(healthbar.value)

func _process(delta):
	healthbar.value = health_component.health
	#manabar.value = PlayerInfo.mana
	
