extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BG/Reflejos.play("ReflejosGrandes")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
