extends CanvasLayer

func show_message(text):
	$Message.show()
	$MessageTimer.start()
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func _on_start_button_pressed():
	$StartButton.hide()
	get_tree().change_scene_to_file("res://Scenes/Instructions/instructions.tscn")

func _on_message_timer_timeout():
	$Message.hide()
