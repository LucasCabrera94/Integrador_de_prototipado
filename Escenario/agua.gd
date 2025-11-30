extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AguaMovimiento.play("AguaMovimiento")
	$AguaReflejos.play("Reflejos2")
	$AguaReflejos2.play("Reflejos2")
