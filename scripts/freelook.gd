extends Camera

export var mouse_sensitivity: float = 0.1
export var move_speed: float = 0.1
export var captured: bool = false


func _ready():
	pass


func _physics_process(delta):
	var input_vector: Vector2 = Vector2(
		int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
		int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	)
	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized()
		translate(Vector3(input_vector.x, 0, input_vector.y) * move_speed)

	if Input.is_action_just_pressed("freelook_toggle"):
		captured = !captured
		var mode
		if captured:
			mode = Input.MOUSE_MODE_CAPTURED
		else:
			mode = Input.MOUSE_MODE_VISIBLE
		Input.set_mouse_mode(mode)


func _input(event):
	if captured:
		aim(event)


func aim(event: InputEvent):
	var mouse_motion: InputEventMouseMotion = event as InputEventMouseMotion
	if mouse_motion != null:
		var rotation: Vector3 = rotation_degrees
		rotation.y -= mouse_motion.relative.x * mouse_sensitivity
		rotation_degrees = rotation

		var current_tilt: float = rotation_degrees.x
		current_tilt -= mouse_motion.relative.y * mouse_sensitivity

		var camera_rotation: Vector3 = rotation_degrees
		camera_rotation.x = clamp(current_tilt, -90, 90)
		rotation_degrees = camera_rotation
