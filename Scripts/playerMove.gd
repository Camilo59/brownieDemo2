extends CharacterBody3D

const GRAVITY = -9.8
const JUMP_FORCE = 5.0
const MOVE_SPEED = 5.0

func _physics_process(delta):
	# Resetea la velocidad en el eje X
	velocity.x = 0

	if Input.is_action_pressed("move_right"):
		velocity.x += MOVE_SPEED
	if Input.is_action_pressed("move_left"):
		velocity.x -= MOVE_SPEED
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_FORCE

	# Aplicar la gravedad
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Mueve el cuerpo según la velocidad
	move_and_slide()


