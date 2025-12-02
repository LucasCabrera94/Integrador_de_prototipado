extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var abierto: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.tengollave == true and abierto == false:
			animated_sprite_2d.play("Desbloqueado")
			abierto = true
