extends Node

func _on_portal_body_entered(body):
	if body is Player:
		if body.bonesTaken == 3:
			get_tree().change_scene_to_file("res://Scenes/Niveles/transition_level3.tscn")
		else:
			body.showMessage("Todavía te falta encontrar "+ str(3-body.bonesTaken) +" fósil/es")
