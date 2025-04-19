class_name Player extends CharacterBody2D

const SPEED = 100
var v: Vector2
var player_looking: Vector2

func get_input(delta: float):
	var input_direction = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
	if abs(input_direction.x) == 1 or abs(input_direction.y) == 1:
		player_direction(input_direction)
	v = input_direction * SPEED * delta

func player_direction(input_direction: Vector2):
	player_looking = input_direction

func _physics_process(delta: float) -> void:
	get_input(delta)
	move_and_collide(v)
