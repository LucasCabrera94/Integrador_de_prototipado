extends StaticBody2D

func _ready() -> void:
	# Animaciones del cañón
	$AnimatedSprite2D.play("Idle")
	$AnimatedSprite2D2.play("idle")

	# --- Tween del movimiento (flotando/balanceo) ---
	var tween = create_tween()
	var dur = 1.5

	tween.tween_property(self, "position:y", position.y + 10, dur)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)

	tween.tween_property(self, "position:y", position.y - 10, dur)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)

	tween.set_loops()  # se repite para siempre
