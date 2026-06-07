extends Node2D
@export var thisSceneCamera: puzzleCamera 
@export var roundRequirements: Array = [[1], [2], [3], [4, 5], [6, 7], [6,3], [2, 8, 6], [9, 1, 7], [3, 6, 10], [6, 8, 9, 5]]       
@export var items: Array[Node2D]
#@export var itemtest: Node2D
var currentRound: int = 0
var currentRoundSubmission: Array = []
var pulsos: int = 0


func _ready():
	updateRoundLabel()
	thisSceneCamera.endRound.connect(endRound)
	
	for i in items:
		var e = i.get_child(0).get_child(0)
		e.IDtransfer.connect(recieveID)
		print(i)
		
	pass 



func _process(delta):
	pass
	


func endRound(text):
	currentRoundSubmission.append(text)
	print(currentRoundSubmission)
	$FondoSinTerminar/HandAnimation.play("MANO")
	if not (currentRoundSubmission == roundRequirements[currentRound]):
		printerr("Ronda fallida, reiniciar la ronda")
		return
	printerr("Ronda exitosa, avanzar a la siguiente ronda")
	currentRound += 1
	print(text)
	updateRoundLabel()


func recieveID(itemID):
	currentRoundSubmission.append(itemID)
	print("wiwiwiw")
# función recibir ID, append itemID al array CurrentRoundSubmission


func updateRoundLabel():
	$Camera2D/Label.set_text("Ronda: " + str(currentRound + 1))
