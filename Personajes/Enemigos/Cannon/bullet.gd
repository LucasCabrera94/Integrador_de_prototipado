extends Area2D

const SPEED = 10
var direction := Vector2.RIGHT

func _process(delta: float) -> void:
	position += direction * SPEED * delta

	# eliminar si sale de la pantalla
	if not get_viewport_rect().has_point(global_position):
		queue_free()
		
