extends CharacterBody2D
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_up: RayCast2D = $RayCastUp
@onready var ray_cast_down: RayCast2D = $RayCastDown
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var player: Player = $"../Player"

const speed = 300
var kick: bool
var collision

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	return

func input():
	kick = false
	if Input.is_action_just_pressed('kick'):
		kick = true
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	input()
	if kick:
		if ray_cast_left.is_colliding() and player.player_looking.x == 1:
			velocity.x = speed * delta
			velocity.y = 0
		if ray_cast_right.is_colliding() and player.player_looking.x == -1:
			velocity.x = -1 * speed * delta
			velocity.y = 0
		if ray_cast_up.is_colliding() and player.player_looking.y == 1:
			velocity.x = 0
			velocity.y = speed * delta
		if ray_cast_down.is_colliding() and player.player_looking.y == -1:
			velocity.x = 0
			velocity.y = -1 * speed * delta
	if velocity:
		collision_shape_2d.scale.x = .95
		collision_shape_2d.scale.y = .95
		move_and_collide(velocity)
		collision = move_and_collide(velocity)
	if collision:
		collision_shape_2d.scale.x = 1
		collision_shape_2d.scale.y = 1
		if velocity.y:
			position.y = roundf(position.y)
		if velocity.x:
			position.x = roundf(position.x)
		velocity.x = 0
		velocity.y = 0
		collision = null
