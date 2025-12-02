extends StaticBody2D
const BULLET = preload("res://Personajes/Enemigos/Cannon/Bullet.tscn")
@onready var marker_2d: Marker2D = $Marker2D

func _ready():
	pass # Replace with function body.
	
#func _process(delta: float) -> void:
	pass
	
func shoot():
	var newbullet = BULLET.instantiate()
	newbullet.global_position = marker_2d.global_position
	newbullet.global_rotation = global_rotation
	get_parent().add_child(newbullet)


func _on_timer_timeout() -> void:
	shoot()
