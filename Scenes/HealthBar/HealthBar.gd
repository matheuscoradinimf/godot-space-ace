extends TextureProgressBar

class_name HealthBar

signal died

const COLOR_DANGER: Color = Color("#cc0000")
const COLOR_MIDDLE: Color = Color("#ff9900")
const COLOR_GOOD: Color = Color("#33cc33")

@export var max_health: int = 100
@export var level_medium: int = 65
@export var level_low: int = 30
@export var start_health: int = 100

func _ready() -> void:
	SignalHub.on_player_hit.connect(on_player_hit)
	max_value = max_health
	value = start_health
	set_color()

func set_color() -> void:
	if value < level_low:
		tint_progress = COLOR_DANGER
	elif value < level_medium:
		tint_progress = COLOR_MIDDLE
	else:
		tint_progress = COLOR_GOOD

func incr_value(v: int) -> void:
	value += v
	if value <= 0:
		died.emit()
	set_color()

func take_damage(v: int) -> void:
	incr_value(-v)

func on_player_hit(_v: int) -> void:
	take_damage(_v)
