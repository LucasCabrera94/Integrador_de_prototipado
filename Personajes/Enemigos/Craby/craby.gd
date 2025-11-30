extends CharacterBody2D

@export var speed := 30
@export var patrol_distance := 100
@export var gravity := 900.0

var start_x
var direction := 1

func _ready():
	start_x = global_position.x

func _physics_process(delta):
	# GRAVEDAD
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0

	# MOVIMIENTO
	velocity.x = speed * direction

	# ANIMACIONES
	if velocity.x != 0:
		$AnimatedSprite2D.play("Run")
	else:
		$AnimatedSprite2D.play("Idle")
		
	$AnimatedSprite2D.flip_h = (direction == 1)
	
	# LIMITES DE PATRULLA
	if global_position.x > start_x + patrol_distance:
		direction = -1
		$AnimatedSprite2D.flip_h = true

	if global_position.x < start_x - patrol_distance:
		direction = 1
		$AnimatedSprite2D.flip_h = false

	move_and_slide()
