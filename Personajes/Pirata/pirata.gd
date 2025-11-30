class_name Pirata
extends CharacterBody2D

@export var SPEED = 110.0
@export var JUMP_VELOCITY = -340.0

func _physics_process(delta: float) -> void:
	# GRAVEDAD
	if not is_on_floor():
		velocity += get_gravity() * delta

	# SALTO
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# DIRECCIÓN
	var direction := Input.get_axis("izquierda", "derecha")

	if direction > 0:
		$AnimatedSprite2D.scale.x = 1
	elif direction < 0:
		$AnimatedSprite2D.scale.x = -1

	# MOVIMIENTO HORIZONTAL
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
#Animaciones
	if not is_on_floor():
		if velocity.y < 0:
			$AnimatedSprite2D.play("jump")
		else:
			$AnimatedSprite2D.play("Fall")
	else:
		if direction:
			$AnimatedSprite2D.play("Run")
		else:
			$AnimatedSprite2D.play("Idle")


# MUERTE DEL JUGADOR
func _on_damage_detector_body_entered(body):
	if body.is_in_group("enemy"):
		die()

func die():
	print("El jugador murió")

	if $AnimatedSprite2D:
		$AnimatedSprite2D.play("Dead_Ground")

	await get_tree().create_timer(0.3).timeout
	get_tree().reload_current_scene()
