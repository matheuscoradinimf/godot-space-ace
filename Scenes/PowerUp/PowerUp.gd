extends Projectile

class_name PowerUp

enum PowerUpType {
	HEALTH,
	SHIELD,
	RANDOM,
}

const SPEED: float = 80.0
const TEXTURES: Dictionary = {
	PowerUpType.HEALTH: preload("res://assets/misc/powerupGreen_bolt.png"),
	PowerUpType.SHIELD: preload("res://assets/misc/shield_gold.png"),
	PowerUpType.RANDOM: null
}

@onready var sprite_2d: Sprite2D = $Sprite2D

var power_up_type: PowerUpType = PowerUpType.SHIELD:
	get:
		return power_up_type
	set(value):
		power_up_type = value

func setup(_power_up_type: PowerUpType) -> void:
	power_up_type = _power_up_type
		

func _ready() -> void:
	if power_up_type == PowerUpType.RANDOM:
		var random_types = [PowerUpType.HEALTH, PowerUpType.SHIELD]
		var random_type = random_types[randi() % random_types.size()]
		sprite_2d.texture = TEXTURES[random_type]
	else:
		sprite_2d.texture = TEXTURES[power_up_type]

func _process(delta: float) -> void:
	position += delta * SPEED * Vector2.DOWN