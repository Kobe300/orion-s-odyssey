extends Control

@onready var healthbar = $Health/Healthbar
@onready var essencebar = $Essence/EssenceBar
@onready var stamina_bar: TextureProgressBar = $Stamina/StaminaBar
@export var health_component : HealthComponent
@export var stamina_component : StaminaComponent

func _ready():
	healthbar.max_value = health_component.Max_health
	healthbar.value = healthbar.max_value
	print(healthbar.value)
	
	stamina_bar.max_value = stamina_component.Max_stamina
	stamina_bar.value = stamina_bar.max_value
	print(stamina_bar.value)

func _process(delta):
	healthbar.value = health_component.health
	#manabar.value = PlayerInfo.mana
	stamina_bar.value = stamina_component.stamina
	
