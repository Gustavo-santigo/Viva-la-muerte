extends CharacterBody2D
const SPEED = 300.0
@onready var cam = $Camera2D
var camOffset: float = 0

func _process(delta: float) -> void:
	cam.offset = Vector2(camOffset, -150)

	if Input.is_action_pressed("esquerda"):
		camOffset = lerp(camOffset, -100.0, 3.5 * delta)
	elif Input.is_action_pressed("direita"):
		camOffset = lerp(camOffset, 100.0, 3.5 * delta)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("esquerda", "direita")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
