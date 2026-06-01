extends OptionButton

func _ready() -> void:
	add_item("Potato")    # 0
	add_item("Very Low")  # 1
	add_item("Low")       # 2
	add_item("Mid")       # 3
	add_item("High")      # 4
	add_item("Ultra")     # 5
	add_item("NASA PC")   # 6
	selected = 2

func _on_item_selected(index: int) -> void:
	var vp = get_viewport()
	var cam = vp.get_camera_3d()
	var rid = vp.get_viewport_rid()
	
	
	vp.scaling_3d_mode = Viewport.SCALING_3D_MODE_BILINEAR
	vp.scaling_3d_scale = 1.0

	match index:
		0:
			vp.scaling_3d_scale = 0.5
			vp.msaa_3d = Viewport.MSAA_DISABLED
			if cam: cam.far = 30.0
		1:
			vp.scaling_3d_scale = 0.65
			vp.msaa_3d = Viewport.MSAA_DISABLED
			if cam: cam.far = 100.0
		2: 
			vp.scaling_3d_mode = Viewport.SCALING_3D_MODE_FSR2
			vp.scaling_3d_scale = 0.5 
			RenderingServer.viewport_set_fsr_sharpness(rid, 0.5)
			vp.msaa_3d = Viewport.MSAA_DISABLED
			if cam: cam.far = 250.0
		3:
			vp.scaling_3d_mode = Viewport.SCALING_3D_MODE_FSR2
			vp.scaling_3d_scale = 0.67 
			RenderingServer.viewport_set_fsr_sharpness(rid, 1.0)
			vp.msaa_3d = Viewport.MSAA_DISABLED
			if cam: cam.far = 500.0
		4: 
			vp.scaling_3d_mode = Viewport.SCALING_3D_MODE_FSR2
			vp.scaling_3d_scale = 0.85
			RenderingServer.viewport_set_fsr_sharpness(rid, 1.5)
			vp.msaa_3d = Viewport.MSAA_2X
			if cam: cam.far = 1000.0
		5: 
			vp.scaling_3d_mode = Viewport.SCALING_3D_MODE_FSR2
			vp.scaling_3d_scale = 1.0
			RenderingServer.viewport_set_fsr_sharpness(rid, 2.0)
			vp.msaa_3d = Viewport.MSAA_4X
			if cam: cam.far = 4000.0
		6: 
			vp.scaling_3d_scale = 1.5 
			vp.msaa_3d = Viewport.MSAA_8X
			if cam: cam.far = 8000.0



func _on_check_box_toggled(toggled_on: bool) -> void:
	var fps_label = get_node("/root/Node3D/hud/fps")
	if toggled_on:
		print("Enabled!")
		fps_label.show()
	else:
		print("Disabled!")
		fps_label.hide()
func _process(delta: float) -> void:
	get_node("/root/Node3D/hud/fps").text = "FPS: " + str(Engine.get_frames_per_second())
