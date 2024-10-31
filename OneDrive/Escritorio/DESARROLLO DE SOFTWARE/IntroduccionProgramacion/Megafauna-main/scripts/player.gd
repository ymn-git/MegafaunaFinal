extends CharacterBody2D
class_name Player

const SPEED = 130.0
const JUMP_VELOCITY = -320.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var bonesTaken = 0

@onready var animated_sprite = $AnimatedSprite2D


func _ready():
	SetLifeText()
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	#Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	#Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Quieto")
		else:
			animated_sprite.play("Corriendo")
	else:
		animated_sprite.play("Quieto")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func takeBone():
	bonesTaken+=1
	$CanvasLayer/Fósiles.text = "Fósiles recolectados: " + str(bonesTaken)

func SetLifeText():
	$CanvasLayer/Vidas.text = "Vidas: " + str(GameController.get_lifes())
	
func showMessage(message):
	$CanvasLayer/Mensaje.visible = true
	$CanvasLayer/Mensaje.text = message
	$CanvasLayer/Mensaje/MensajeTimer.start()

func hideMessage():
	$CanvasLayer/Mensaje.visible=false

func _on_mensaje_timer_timeout():
	hideMessage()
