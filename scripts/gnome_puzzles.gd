extends Node2D
@export var thisSceneCamera: puzzleCamera 
@export var roundRequirements: Array = [[1], [2], [3], [4, 5], [6, 7], [6,3], [2, 8, 6], [9, 1, 7], [3, 6, 10], [6, 8, 9, 5]]       
@export var roundRequirementsLITE: Array = [[1], [2], [3], [4], [5], [6], [7], [8], [9], [10]] 
@export var items: Array[Node2D]
@export var health: healthComponent
const RUMPEL_INTRO_1 = preload("uid://chw485yf850v0")
const RUMPEL_INTRO_2 = preload("uid://chslvbllm3tvm")
const RUMPEL_TUTO = preload("uid://c1fu17wudreoy")


const FINAL_ROUND: int = 5 ##############
var currentRound: int = 0
var currentRoundSubmission: Array = []
var pulsos: int = 0




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

#no se llama
func startDialogue():
	DialogueManager.dialogue_ended.connect(PlayFreakyRumpel)
	DialogueManager.show_dialogue_balloon(RUMPEL_INTRO_1)
#no se llama
	
#no se llama
func PlayFreakyRumpel():
	print("dialogueEnded")
#no se llama

func _process(delta):
	pass

func startRound():
	magicTrick()
	


func endRound(text):
	if not (currentRoundSubmission == roundRequirementsLITE[currentRound]):
		printerr("Ronda fallida, reiniciar la ronda")
		currentRoundSubmission = []
		$Camera2D/debugLabel.set_text("RONDA FALLIDA")
		$GrmRumpelBrazoBase.hide()
		$"08_manga".hide()
		playAnimation($FondoSinTerminar/RumpelBrazo, "brazoDano")
		health.healthDown()
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
	for magicTrick in roundRequirementsLITE[currentRound]:
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
				$GrmRumpelCaraPlatano.show()
				
			4:
				$GrmRumpelCaraPlatano.hide()
				$GrmRumpelBarbaPlatano.show()
				
			5:
				$GrmRumpelBarbaPlatano.hide()
				$BananaBataAnimacion.hide()
				$BananaBataAnimacion.play("animacionBananaBata")
				
			6:
				$BananaBataAnimacion.hide()
				$GrmRumpeDobleV01.show()
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
	$FondoSinTerminar/RumpelBrazo.stop()
	$FondoSinTerminar/RumpelBrazo.hide()
	$manitoxMagicas.show()
	$GrmRumpelBrazoBase.hide()
	$"08_manga".hide()
	$manitoxMagicas.play("animacionManosMagicas")
	await get_tree().create_timer(10).timeout
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
