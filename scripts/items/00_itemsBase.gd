extends Area2D
class_name customItem

var itemID: int = 0


func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("IA_click"):
		print("click!!!!")
		print(itemID)
func _on_mouse_entered():
	print(itemID)
