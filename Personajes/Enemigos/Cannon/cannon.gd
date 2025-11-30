extends StaticBody2D


@export var bullet : PackedScene
func _ready():
	pass # Replace with function body.
	
#func _process(delta: float) -> void:
	pass
	
func shoot():
	var newbullet = bullet.instantiate()
	newbullet.global_position = $spawbullet.global_position
	get_parent().add_child(newbullet)
