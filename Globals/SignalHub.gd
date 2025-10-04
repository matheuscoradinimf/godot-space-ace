extends Node


signal on_player_hit(v: int)
signal on_score_updated(v: int)
signal on_create_explosion(pos: Vector2, anim_name: String)
signal on_create_power_up(pos: Vector2, power_up_type: PowerUp.PowerUpType)
signal on_create_bullet(pos: Vector2, dir: Vector2, speed: float, bullet_type: BulletBase.BulletType)
signal on_player_health_bonus(v: int)

func emit_on_player_hit(v: int) -> void:
	on_player_hit.emit(v)


func emit_on_score_updated(v: int):
	on_score_updated.emit(v)

func emit_on_create_explosion(position: Vector2, anim_name: String) -> void:
	on_create_explosion.emit(position, anim_name)

func emit_on_create_power_up(pos: Vector2, power_up_type: PowerUp.PowerUpType) -> void:
	on_create_power_up.emit(pos, power_up_type)

func emit_on_create_bullet(pos: Vector2, dir: Vector2, speed: float, bullet_type: BulletBase.BulletType) -> void:
	on_create_bullet.emit(pos, dir, speed, bullet_type)

func emit_on_player_health_bonus(v: int) -> void:
	on_player_health_bonus.emit(v)