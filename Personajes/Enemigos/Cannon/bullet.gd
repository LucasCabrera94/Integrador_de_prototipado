extends Area2D

const SPEED = 170
var direction: Vector2

func _ready():

	direction = Vector2.LEFT.rotated(global_rotation)

func _physics_process(delta):
	# Movimiento real sin deformaciones del padre
	global_position += direction * SPEED * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
