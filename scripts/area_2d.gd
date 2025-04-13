extends CharacterBody2D

const speed = 300
var normalized_velocity: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	move_and_collide(normalized_velocity * speed * delta)

func _on_body_entered(body: Node2D) -> void:
	if body is not Player:
		return
	var player: Player = body
	normalized_velocity = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
	print(player.velocity)
	
