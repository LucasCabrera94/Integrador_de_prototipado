extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("Idle")

func _on_body_entered(body):
	if body.is_in_group("player"): 
		body.tengollave = true
		DatosDelJuego.PosicionGlobal = body.global_position
		queue_free()
