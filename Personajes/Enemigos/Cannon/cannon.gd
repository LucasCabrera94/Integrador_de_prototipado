extends StaticBody2D
const BULLET = preload("res://Personajes/Enemigos/Cannon/Bullet.tscn")

func _ready():
	pass # Replace with function body.
	
#func _process(delta: float) -> void:
	pass
	
func shoot():
	var newbullet = BULLET.instantiate()
	newbullet.global_position = $spawbullet.global_position
	get_parent().add_child(newbullet)


func _on_timer_timeout() -> void:
	shoot()
