extends CharacterBody2D

@export var walk_texture: Texture2D
@export var fly_texture: Texture2D
@export var walk_shape: Shape2D
@export var fly_shape: Shape2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D

const SPEED = 400.0
const JUMP_VELOCITY = -600.0
var current_speed := SPEED


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if not is_on_floor():
		sprite.texture = fly_texture
		collision.shape = fly_shape
	if is_on_floor():
		sprite.texture = walk_texture
		collision.shape = walk_shape

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	current_speed = SPEED
	if Input.is_action_pressed("sprint") and is_on_floor():
		current_speed = SPEED*1.5

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * current_speed
		sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _ready() -> void:
	get_tree().paused = false

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
