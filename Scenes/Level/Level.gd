extends Node2D


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("test"):
		var escolha = randi() % 3
		match escolha:
			0:
				SignalHub.emit_on_create_power_up(Vector2(320, 0), PowerUp.PowerUpType.HEALTH)
			1:
				SignalHub.emit_on_create_bullet(Vector2(320, 0), Vector2.DOWN, 400.0, BulletBase.BulletType.ENEMY)
			2:
				SignalHub.emit_on_create_power_up(Vector2(320, 0), PowerUp.PowerUpType.SHIELD)
