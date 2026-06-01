extends Control


var linked_ball: CharacterBody3D 

func _process(_delta: float) -> void:
	if is_instance_valid(linked_ball):
		
		$px.placeholder_text = str(snapped(linked_ball.global_position.x, 0.01))
		$py.placeholder_text = str(snapped(linked_ball.global_position.y, 0.01))
		$pz.placeholder_text = str(snapped(linked_ball.global_position.z, 0.01))
		
		$vx.placeholder_text = str(snapped(linked_ball.velocity.x, 0.01))
		$vy.placeholder_text = str(snapped(linked_ball.velocity.y, 0.01))
		$vz.placeholder_text = str(snapped(linked_ball.velocity.z, 0.01))
	else:
		queue_free()



func _ready():
	print("UI Panel is alive and linked to: ", linked_ball)


func _on_vx_text_submitted(new_text: String) -> void:
	if is_instance_valid(linked_ball):
		linked_ball.grav_velocity.x = new_text.to_float()

		print("Ball velocity.x is now: ", linked_ball.velocity.x)


func _on_vz_text_submitted(new_text: String) -> void:
	if is_instance_valid(linked_ball):
		linked_ball.grav_velocity.z = new_text.to_float()


func _on_vy_text_submitted(new_text: String) -> void:
	if is_instance_valid(linked_ball):
		linked_ball.grav_velocity.y = new_text.to_float()
		
		


func _on_ms_text_submitted(new_text: String) -> void:
	linked_ball.mass = new_text.to_float()


func _on_px_text_submitted(new_text: String) -> void:
	if is_instance_valid(linked_ball):
		linked_ball.global_position.x = new_text.to_float()

func _on_py_text_submitted(new_text: String) -> void:
	if is_instance_valid(linked_ball):
		linked_ball.global_position.y = new_text.to_float()


func _on_pz_text_submitted(new_text: String) -> void:
	if is_instance_valid(linked_ball):
		linked_ball.global_position.z = new_text.to_float()
