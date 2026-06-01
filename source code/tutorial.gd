extends Control



func _ready() -> void:
	pass # Replace with function body.



func _process(delta: float) -> void:
	pass


func _on_button_2_pressed() -> void:
	hide()


func _on_button_pressed() -> void:
	$stage0.hide()
	$stage1.show()


func _on_next_pressed() -> void:
	$stage1.hide()
	$stage2.show()


func _on_done_pressed() -> void:
	hide()
