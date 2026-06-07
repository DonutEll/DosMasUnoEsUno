extends Node2D
@export var thisSceneCamera: puzzleCamera 
@export var roundRequirements: Array = [[1], [2], [3], [4, 5], [6, 7], [6,3], [2, 8, 6], [9, 1, 7], [3, 6, 10], [6, 8, 9, 5]]       
var currentRound: int = 0
var currentRoundSubmission: Array = []
var pulsos: int = 0
var vidas: int = 3



func _ready():
	updateRoundLabel()
	thisSceneCamera.endRound.connect(endRound)
	magicTrick()



func _process(delta):
	pass
	


func endRound(text):
	currentRoundSubmission.append(text)
	print(currentRoundSubmission)
	if not (currentRoundSubmission == roundRequirements[currentRound]):
		#printerr("Ronda fallida, reiniciar la ronda")
		vidas -= 1
		playAnimation($FondoSinTerminar/RumpelBrazo, "brazoDano")
		if vidas <= 0:
			#print("Game Over")
			pass
		return
	#printerr("Ronda exitosa, avanzar a la siguiente ronda")
	currentRound += 1
	updateRoundLabel()


func updateRoundLabel():
	$Camera2D/Label.set_text("Ronda: " + str(currentRound + 1))
	

func magicTrick():
	for magicTrick in roundRequirements[currentRound]:
		playAnimation($Camera2D/explosionAnimation, "pufExplosion")
		playAnimation($FondoSinTerminar/RumpelBrazo, "brazoWiwiwi")
		match magicTrick:
			1:
				pass
			2: 
				pass
			3: 
				pass
			4:
				pass
			5:
				pass
			6:
				pass
			7:
				pass
			8:
				pass
			9:
				pass
			10:
				pass
		#esperar 3 segundines

func playAnimation(animationNode, animationPlayed):
	animationNode.show()
	animationNode.play(animationPlayed)
	await animationNode.animation_finished      #Esto es un pelín sucio
	animationNode.hide()
	#animationNode.animation_finished.connect(animationFinished)
	
	
#func animationFinished(animationNode: AnimatedSprite2D):
	#animationNode.animation_finished.disconnect(animationFinished)
	#animationNode.hide()
