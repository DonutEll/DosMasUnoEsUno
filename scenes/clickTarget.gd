extends Area2D

func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("IA_click"):
		print("click!!!!")
	


func _on_mouse_entered() -> void:
	print("wiwiwiwi") # Replace with function body.
