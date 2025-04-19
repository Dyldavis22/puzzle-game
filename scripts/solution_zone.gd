class_name SolutionZone extends Area2D

var covered: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body:Node2D) -> void:
	covered = true
	print(name + str(covered))

func _on_body_exited(body: Node2D) -> void:
	covered = false
	print(name + str(covered))
