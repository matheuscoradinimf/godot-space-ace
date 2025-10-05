extends Node2D

class_name ObjectMaker

const ADD_OBJECT: String = "add_object"
const EXPLOSION: = preload("res://Scenes/Explosion/Explosion.tscn")
const POWER_UP: = preload("res://Scenes/PowerUp/PowerUp.tscn")
const BULLET_PLAYER: = preload("res://Scenes/Projectile/BulletBase/BulletPlayer.tscn")
const BULLET_ENEMY: = preload("res://Scenes/Projectile/BulletBase/BulletEnemy.tscn")
const BULLET_BOMB: = preload("res://Scenes/Projectile/BulletBase/BulletBomb.tscn")
const HOMING_MISSILE: = preload("res://Scenes/Projectile/HomingMissile/HomingMissile.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_create_explosion.connect(on_create_explosion)
	SignalHub.on_create_power_up.connect(on_create_power_up)
	SignalHub.on_create_bullet.connect(on_create_bullet)
	SignalHub.on_create_homing_missile.connect(on_create_homing_missile)



func add_object(obj: Node, pos: Vector2) -> void:
	add_child(obj)
	obj.global_position = pos

func on_create_homing_missile(pos: Vector2) -> void:
	var scene: HomingMissile = HOMING_MISSILE.instantiate()
	call_deferred(ADD_OBJECT, scene, pos)

func on_create_explosion(pos: Vector2, anim_name: String) -> void:
	var scene: Explosion = EXPLOSION.instantiate()
	scene.setup(anim_name)
	call_deferred(ADD_OBJECT, scene, pos)

func on_create_power_up(pos: Vector2, power_up_type: PowerUp.PowerUpType) -> void:
	print("on_create_power_up", power_up_type)
	var scene: PowerUp = POWER_UP.instantiate()
	scene.setup(power_up_type)
	call_deferred(ADD_OBJECT, scene, pos)

func on_create_bullet(pos: Vector2, dir: Vector2, speed: float, bullet_type: BulletBase.BulletType) -> void:
	var scene: BulletBase
	match bullet_type:
		BulletBase.BulletType.PLAYER:
			scene = BULLET_PLAYER.instantiate()
		BulletBase.BulletType.ENEMY:
			scene = BULLET_ENEMY.instantiate()
		BulletBase.BulletType.BOMB:
			scene = BULLET_BOMB.instantiate()

	if scene:
		scene.setup(dir, speed)
		call_deferred(ADD_OBJECT, scene, pos)