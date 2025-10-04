extends Area2D


class_name Player


const GROUP_NAME: String = "Player"
const MARGIN: float = 16.0

@export var health_bonus: int = 25
@export var bullet_speed: float = 400.0
@export var speed: float = 400.0
@export var bullet_direction: Vector2 = Vector2.UP


@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var shield: Shield = $Shield
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var _lower_margin: float = 0.0
var _upper_margin: float = 0.0
var _left_margin: float = 0.0
var _right_margin: float = 0.0

func _ready() -> void:
	var vp: Rect2 = get_viewport_rect()
	_lower_margin = vp.position.y + MARGIN
	_upper_margin = vp.size.y - MARGIN
	_left_margin = vp.position.x + MARGIN
	_right_margin = vp.size.x - MARGIN
	


func _enter_tree() -> void:
	add_to_group(GROUP_NAME)


func _process(delta: float) -> void:
	var input = get_input()
	global_position += input * speed * delta
	global_position.x = clamp(global_position.x, _left_margin, _right_margin)
	global_position.y = clamp(global_position.y, _lower_margin, _upper_margin)

func get_input() -> Vector2:

	var v = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down"),
	)

	if v.x != 0:
		animation_player.play("turn")
		sprite_2d.flip_h = v.x > 0
	else:
		animation_player.play("fly")

	return v.normalized()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		SignalHub.emit_on_create_bullet(global_position, bullet_direction, bullet_speed, BulletBase.BulletType.PLAYER)

func _on_area_entered(area:Area2D) -> void:
	if area is PowerUp:
		match area.power_up_type:
			PowerUp.PowerUpType.SHIELD:
				shield.enable_shield()
			PowerUp.PowerUpType.HEALTH:
				SignalHub.emit_on_player_health_bonus(health_bonus)
	elif area is Projectile:
		SignalHub.emit_on_player_hit(area.get_damage())
		print("PLAYER:: player hit")
