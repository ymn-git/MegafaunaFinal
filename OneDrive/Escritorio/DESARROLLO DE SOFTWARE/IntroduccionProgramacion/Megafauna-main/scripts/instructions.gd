extends CanvasLayer
# Notifies `Main` node that the button has been pressed

func _on_comenzar_juego_pressed():
	$ButtonComenzar.hide()
	get_tree().change_scene_to_file("res://Scenes/Niveles/miramar.tscn")
	



