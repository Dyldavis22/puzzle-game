class_name Player extends CharacterBody2D

const SPEED = 100
var v: Vector2

func get_input(delta: float):
	var input_direction = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
	v = input_direction * SPEED * delta

func _physics_process(delta: float) -> void:
	get_input(delta)
	move_and_collide(v)
