extends Control


func _on_inicio_pressed():
	get_tree().change_scene_to_file("res://Scenes/Niveles/miramar.tscn")

func _on_megafauna_pressed():
	get_tree().change_scene_to_file("res://Scenes/Niveles/Megafauna.tscn")
	
func _on_instrucciones_pressed():
	get_tree().change_scene_to_file("res://Scenes/Niveles/instrucciones.tscn")
	
func _on_salir_pressed():
	get_tree().quit()
