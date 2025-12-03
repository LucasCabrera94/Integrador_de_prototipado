extends Node2D

var time_left: int = 120  # segundos totales

func _ready() -> void:
	$UI/TimerLabel.text = format_time(time_left)
	$GameTimer.start()

func _on_game_timer_timeout() -> void:
	time_left -= 1
	$UI/TimerLabel.text = format_time(time_left)

	if time_left <= 0:
		$GameTimer.stop()
		print("¡Tiempo terminado!")

func format_time(seconds: int) -> String:
	var minutes :int = seconds / 60
	var secs: int= seconds % 60
	return "%02d:%02d" % [minutes, secs]
