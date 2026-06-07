extends Camera2D

class_name puzzleCamera

@export var speed: int = 300
var movingDown: bool = false
var movingUp: bool = false
const MIN_HEIGHT: int = 0
var MAX_HEIGHT: int 

signal endRound()

func _ready():
	MAX_HEIGHT = 2160 - get_viewport_rect().size.y
	


func _process(delta):
	if Input.is_action_pressed("ScrollDown") or movingDown:
		position.y += speed * delta
	if Input.is_action_pressed("ScrollUp") or movingUp:
		position.y -= speed * delta
	
	position.y = clamp(position.y, MIN_HEIGHT, MAX_HEIGHT)


func _on_scroll_down_area_mouse_entered():
	movingDown = true


func _on_scroll_down_area_mouse_exited():
	movingDown = false


func _on_scroll_up_area_mouse_entered():
	movingUp = true


func _on_scroll_up_area_mouse_exited():
	movingUp = false


func _on_ready_button_pressed():
	emit_signal("endRound", 1)
	print("botón")
