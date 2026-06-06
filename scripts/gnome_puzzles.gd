extends Node2D
@export var thisSceneCamera: puzzleCamera 
@export var roundRequirements: Array = [[1], [2], [3], [4, 5], [6, 7], [6,3], [2, 8, 6], [9, 1, 7], [3, 6, 10], [6, 8, 9, 5]]       
var currentRound: int = 0
var currentRoundSubmission: Array = []
var pulsos: int = 0


func _ready():
	updateRoundLabel()
	thisSceneCamera.endRound.connect(endRound)



func _process(delta):
	pass


func endRound(text):
	currentRoundSubmission.append(text)
	print(currentRoundSubmission)
	if not (currentRoundSubmission == roundRequirements[currentRound]):
		printerr("Ronda fallida, reiniciar la ronda")
		return
	printerr("Ronda exitosa, avanzar a la siguiente ronda")
	currentRound += 1
	print(text)
	updateRoundLabel()


func updateRoundLabel():
	$Camera2D/RoundLabel.set_text("Ronda: " + str(currentRound + 1))
