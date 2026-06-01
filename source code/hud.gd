extends Control



func _ready() -> void:
	
	get_tree().paused = true


func _process(delta: float) -> void:
	pass


func _on_settings_pressed() -> void:
	
	if $setings2.visible:
		$setings2.hide()
	else:
		$setings2.show()


func _on_launch_pressed() -> void:
	get_tree().paused = false


func _on_stop_pressed() -> void:
	get_tree().paused = true


func _on_button_pressed() -> void:
	pass # Replace with function body.
