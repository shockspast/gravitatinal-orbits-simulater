extends VBoxContainer

var ball_scene = preload("res://Ball.tscn")
var controls = preload("res://ball_control.tscn")

@export var xr = 0
@export var yr = 0
@export var zr = 0

var ball_count = 0 
func _ready() -> void:
	pass
	
func spawn_my_ball(p_x, p_y, p_z):
	ball_count += 1 
	
	var ball = ball_scene.instantiate()
	get_tree().root.add_child(ball)
	ball.global_position = Vector3(p_x, p_y, p_z)
	

	ball.add_to_group("spawned_balls")
	
	var con = controls.instantiate()
	con.linked_ball = ball 	
	
	if con.has_node("BallNumberLabel"):
		con.get_node("BallNumberLabel").text = "Ball #" + str(ball_count)
	
	add_child(con)
	move_child($Button, -1)
func _on_button_pressed() -> void:
	
	spawn_my_ball.call_deferred(xr, yr, zr)


func _on_reset_pressed() -> void:

	var balls = get_tree().get_nodes_in_group("gravity_bodies")
	

	for ball in balls:
		ball.queue_free()
		

	ball_count = 0
