extends MeshInstance3D

@export var trail_color: Color = Color.WHITE
@export var max_points: int = 200
@export var distance_threshold: float = 0.1 

var points: Array[Vector3] = []

func _ready():
	mesh = ImmediateMesh.new() 
	set_as_top_level(true)
	global_transform = Transform3D.IDENTITY
	
	
	var mat = StandardMaterial3D.new()
	mat.shading_mode = StandardMaterial3D.SHADING_MODE_UNSHADED
	mat.vertex_color_use_as_albedo = true 
	material_override = mat
	trail_color = Color(randf(), randf(), randf())

func _process(_delta):
	var curr_pos = get_parent().global_position
	if points.is_empty() or curr_pos.distance_to(points[-1]) > distance_threshold:
		points.append(curr_pos)
		if points.size() > max_points:
			points.remove_at(0)
		_update_trail()

func _update_trail():
	mesh.clear_surfaces()
	if points.size() < 2: return

	mesh.surface_begin(Mesh.PRIMITIVE_LINE_STRIP)
	for i in range(points.size()):
	
		mesh.surface_set_color(trail_color) 
		mesh.surface_add_vertex(points[i])
	mesh.surface_end()
