extends Node2D
@export var thisSceneCamera: puzzleCamera 
@export var roundRequirements: Array = [[1], [2], [3], [4, 5], [6, 7], [6,3], [2, 8, 6], [9, 1, 7], [3, 6, 10], [6, 8, 9, 5]]       
@export var items: Array[Node2D]
@export var health: healthComponent

const FINAL_ROUND: int = 2
var currentRound: int = 0
var currentRoundSubmission: Array = []
var pulsos: int = 0
var vidas: int = 3




func _ready():
	updateRoundLabel()
	thisSceneCamera.endRound.connect(endRound)
	health.death.connect(gameOver)
	
	for i in items:
		var e = i.get_child(0).get_child(0)
		e.IDtransfer.connect(recieveID)
		print(i)
	
	startRound()
	$manitoxMagicas.play("animacionManosMagicas")



func _process(delta):
	pass
	


func startRound():
	magicTrick()
	


func endRound(text):
	if not (currentRoundSubmission == roundRequirements[currentRound]):
		printerr("Ronda fallida, reiniciar la ronda")
		currentRoundSubmission = []
		$Camera2D/debugLabel.set_text("RONDA FALLIDA")
		health.healthDown()
		playAnimation($FondoSinTerminar/RumpelBrazo, "brazoDano")
		return
	$Camera2D/debugLabel.set_text("RONDA EXITOSA")
	printerr("Ronda exitosa, avanzar a la siguiente ronda")
	currentRoundSubmission = []
	currentRound += 1
	if currentRound == FINAL_ROUND:
		get_tree().change_scene_to_file("res://scenes/Testing/loseMenu.tscn")
		return
	updateRoundLabel()
	startRound()


func recieveID(itemID):
	currentRoundSubmission.append(itemID)
# función recibir ID, append itemID al array CurrentRoundSubmission


func updateRoundLabel():
	$Camera2D/Label.set_text("Ronda: " + str(currentRound + 1))
	

func magicTrick():
	$Camera2D/tuTurno.set_text("ESPERA...")
	for magicTrick in roundRequirements[currentRound]:
		playAnimation($Camera2D/explosionAnimation, "pufExplosion")
		playAnimation($FondoSinTerminar/RumpelBrazo, "brazoWiwiwi")
		match magicTrick:
			1:
				$actionAnimation01.show()
				$actionAnimation01.play("bananaString")
				#platano girando
			2: 
				$actionAnimation01.hide()
				$actionAnimation01.stop()
				$actionAnimation02.show()
				$actionAnimation02/AnimationPlayer.play("upAndDown")
				#platano arriba abajo
			3: 
				$actionAnimation02.hide()
				$actionAnimation02/AnimationPlayer.stop()
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
		await get_tree().create_timer(3).timeout
		#esperar 3 segundines
	$Camera2D/tuTurno.set_text("TU TURNO!")


func updateContainer():
	pass


func gameOver():
	#play manitos
	#await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://scenes/Testing/victoryMenu.tscn")



func playAnimation(animationNode, animationPlayed):
	print(animationPlayed)
	animationNode.show()
	animationNode.play(animationPlayed)
	await animationNode.animation_finished      #Esto es un pelín sucio
	animationNode.hide()
	#animationNode.animation_finished.connect(animationFinished)
	
	
#func animationFinished(animationNode: AnimatedSprite2D):
	#animationNode.animation_finished.disconnect(animationFinished)
	#animationNode.hide()
