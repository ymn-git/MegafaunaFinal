extends AnimatableBody2D

@export var fliped = true

func _process(delta):
	if fliped:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
