extends Area2D

func _ready():
	$AnimatedSprite2D.play("idle")

func _on_body_entered(body):
	if body.is_in_group("player"): 
		body.monedero += 1
		print(body.monedero)
		queue_free()
