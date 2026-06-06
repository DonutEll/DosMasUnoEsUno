extends Sprite2D

func _input(event):
	if event.is_action_pressed("IA_click"):
		if is_pixel_opaque(get_local_mouse_position()):
				print("sprite clicked.")
