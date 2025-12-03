extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
const ESPADA = preload("res://Personajes/Pirata/espada.tscn")

var abierto: bool = false
func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.tengollave == true and abierto == false:
			animated_sprite_2d.play("Desbloqueado")
			await animated_sprite_2d.animation_finished
			abierto = true
			crear_espada()

func crear_espada():
	
	if ESPADA != null:
		var espada_instancia = ESPADA.instantiate()
		espada_instancia.global_position = global_position + Vector2(0, -25)
		get_parent().call_deferred("add_child", espada_instancia)
	else:
		print("¡ERROR! Olvidaste poner la escena de la espada en el Inspector del cofre")
