extends Control


@onready var health_bar: HealthBar = $ColorRect/MarginContainer/HealthBar

func _ready() -> void:
	SignalHub.on_player_hit.connect(on_player_hit)
	SignalHub.on_player_health_bonus.connect(on_player_health_bonus)

func on_player_hit(_v: int) -> void:
	health_bar.take_damage(_v)

func on_player_health_bonus(_v: int) -> void:
	health_bar.incr_value(_v)

func _on_health_bar_died() -> void:
	print("GAMEUI:: player died")
