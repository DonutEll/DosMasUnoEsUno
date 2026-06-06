extends Camera2D

@export var speed: int = 300
var movingDown: bool = false
var movingUp: bool = false

func _ready():
	pass 


func _process(_delta):
	cameraScrollDown()
	cameraScrollUp()


func _on_scroll_down_area_mouse_entered():
	movingDown = true


func _on_scroll_down_area_mouse_exited():
	movingDown = false


func _on_scroll_up_area_mouse_entered():
	movingUp = true


func _on_scroll_up_area_mouse_exited():
	movingUp = false


func _on_ready_button_pressed():
	print("botón")



func cameraScrollDown():
	if not movingDown:
		return
	position.y += speed * get_process_delta_time()

func cameraScrollUp():
	if not movingUp:
		return
	position.y -= speed * get_process_delta_time()
