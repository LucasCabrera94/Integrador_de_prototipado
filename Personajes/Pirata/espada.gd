extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Señal opcional por si quieres avisar al juego que se recogió el objeto
signal objeto_recogido(nombre_objeto)

func _ready() -> void:
	# Conectamos la señal de que algo entró en el área
	body_entered.connect(_on_body_entered)
	
# Cuando un cuerpo entra en el área de la espada
func _on_body_entered(body: Node2D) -> void:
	# 1. Verificamos que sea el jugador
	if body.is_in_group("player"):
		if body.has_method("agregar_item"):
			body.agregar_item("espada_maestra")
			objeto_recogido.emit("espada_maestra")
		# ----------------------------
		queue_free()
