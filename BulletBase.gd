extends Projectile


class_name BulletBase

enum BulletType {
	PLAYER,
	ENEMY,
	BOMB,
}

var _dir: Vector2 = Vector2.UP
var _speed: float = 20.0

func _process(delta: float) -> void:
	position += delta * _speed * _dir

func setup(dir: Vector2, speed: float) -> void:
	_dir = dir
	_speed = speed

func blow_up() -> void:
	SignalHub.emit_on_create_explosion(global_position, Explosion.EXPLODE)
	super()