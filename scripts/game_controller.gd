extends Node

var playerLife = 3

func lost_life():
	playerLife-=1
	
	if playerLife==0:
		get_tree().change_scene_to_file("res://Scenes/Niveles/menú.tscn")
		playerLife = 3

func get_lifes():
	return playerLife
