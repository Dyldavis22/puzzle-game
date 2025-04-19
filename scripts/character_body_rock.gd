extends CharacterBody2D
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_up: RayCast2D = $RayCastUp
@onready var ray_cast_down: RayCast2D = $RayCastDown
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

const speed = 300

var direction = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if ray_cast_left.is_colliding():
		velocity.x = speed * delta
		velocity.y = 0
	if ray_cast_right.is_colliding():
		velocity.x = -1 * speed * delta
		velocity.y = 0
	if ray_cast_up.is_colliding():
		velocity.x = 0
		velocity.y = speed * delta
	if ray_cast_down.is_colliding():
		velocity.x = 0
		velocity.y = -1 * speed * delta
	move_and_collide(velocity)
