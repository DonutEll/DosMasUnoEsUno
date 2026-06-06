extends Area2D
class_name customItem

var itemID: int = 0
var itemName = "baseItem"

func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("IA_click"):
		print(itemName)
		
func _on_mouse_entered(): #recordar conectar señal!!
	print("wah")
	var wiwiSprite: Sprite2D = get_parent()
	var wiwiMaterial: ShaderMaterial = wiwiSprite.material

	wiwiMaterial.set_shader_parameter("width",6)

func _on_mouse_exited(): #recordar conectar señal!!
	var wiwiSprite: Sprite2D = get_parent()
	var wiwiMaterial: ShaderMaterial = wiwiSprite.material
	wiwiMaterial.set_shader_parameter("width",0)
