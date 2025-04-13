extends RigidBody2D
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_up: RayCast2D = $RayCastUp
@onready var ray_cast_down: RayCast2D = $RayCastDown
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

const speed = 7000

func _physics_process(delta: float) -> void:
	if ray_cast_left.is_colliding():
		apply_central_impulse(Vector2(speed * delta, 0))
	if ray_cast_right.is_colliding():
		apply_central_impulse(Vector2(-1 * speed * delta, 0))
	if ray_cast_up.is_colliding():
		apply_central_impulse(Vector2(0, speed * delta))
	if ray_cast_down.is_colliding():
		apply_central_impulse(Vector2(0, -1 * speed * delta))
