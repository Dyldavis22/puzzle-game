extends StaticBody2D

@onready var solution_1 = $solution_zone1
@onready var solution_2 = $solution_zone2
@onready var solution_3 = $solution_zone3
@onready var solution_4 = $solution_zone4
@onready var collision = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if solution_1.covered == true and solution_2.covered == true:
		$Sprite2D.visible = not visible
		collision.set_deferred('disabled', true)
