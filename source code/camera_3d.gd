extends Camera3D


@export var move_speed: float = 10.0
@export var look_sensitivity: float = 0.003
@export var zoom_speed: float = 5.0
@export var min_fov: float = 2.0
@export var max_fov: float = 120.0


var sequence_active: bool = false
var camera_yaw: float = 0.0
var camera_pitch: float = 0.0

func _ready() -> void:
	camera_yaw = rotation.y
	camera_pitch = rotation.x
	get_node("/root/Node3D/hud/termanel/command").text = ""
func _unhandled_input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if event.pressed else Input.MOUSE_MODE_VISIBLE
				
		if event.pressed:
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				fov = clamp(fov - zoom_speed, min_fov, max_fov)
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				fov = clamp(fov + zoom_speed, min_fov, max_fov)

	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		camera_yaw -= event.relative.x * look_sensitivity
		camera_pitch -= event.relative.y * look_sensitivity
		camera_pitch = clamp(camera_pitch, -PI/2, PI/2)
		rotation.y = camera_yaw
		rotation.x = camera_pitch

	
	if Input.is_action_just_pressed("shh"):
		sequence_active = true
		print("Sequence started! You have 2 seconds...")
		
		
		get_tree().create_timer(2.0).timeout.connect(func(): 
			sequence_active = false 
			print("Sequence expired.")
		)

	if Input.is_action_just_pressed("shh2"):
		if sequence_active:
			print("Combo successful! Toggling terminal...")
			var terminal = get_node("../hud/termanel")
		
		
			terminal.visible = !terminal.visible

func _process(delta: float) -> void:
	
	var movement := Vector3.ZERO
	
	
	if Input.is_physical_key_pressed(KEY_W): movement -= global_basis.z
	if Input.is_physical_key_pressed(KEY_S): movement += global_basis.z
	if Input.is_physical_key_pressed(KEY_A): movement -= global_basis.x
	if Input.is_physical_key_pressed(KEY_D): movement += global_basis.x
	if Input.is_physical_key_pressed(KEY_SPACE): movement += Vector3.UP
	if Input.is_physical_key_pressed(KEY_SHIFT): movement += Vector3.DOWN

	if movement != Vector3.ZERO:
		global_position += movement.normalized() * move_speed * delta


func _on_line_edit_text_submitted(new_text: String) -> void:

	print_tree_pretty()
	var pop = new_text
	print("User typed: ", pop)
	
	
	if pop == "launch dristen" or pop == "ld":
		
		var pizza = "command executed"
		get_node("/root/Node3D/hud/termanel/command").text = pizza

	
