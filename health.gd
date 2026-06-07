extends Node2D

var health: int = 3
@onready var firstHeart = $HBoxContainer/GnmHealthfullV01_1
@onready var secondHeart = $HBoxContainer/GnmHealthfullV01_2
@onready var thirdHeart = $HBoxContainer/GnmHealthfullV01_3
signal death

func healthDown():
	health = health - 1
	updateHealth()

func getHealth() -> int:
	return health

func updateHealth():
	if health == 3:
		firstHeart.visible = true
		secondHeart.visible = true
		thirdHeart.visible = true
		
	if health == 2:
		firstHeart.visible = true
		secondHeart.visible = true
		thirdHeart.visible = false
		
	if health == 1:
		firstHeart.visible = true
		secondHeart.visible = false
		thirdHeart.visible = false
	
	if health == 0:
		firstHeart.visible = false
		secondHeart.visible = false
		thirdHeart.visible = false
		death.emit()

func _on_button_pressed() -> void:
	healthDown()
