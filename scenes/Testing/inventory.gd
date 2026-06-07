extends Node2D
@export var items: Array[Node2D]
@export var inventory: Array[Node2D]
func _ready():
	for i in items:
		var e = i.get_child(0).get_child(0)
		e.IDtransfer.connect(addItemToInventory)

func addItemToInventory(transferredID):
	#inventory.append()
	var itemToAdd = items[transferredID-1]
	inventory.append(itemToAdd)
	print(inventory)
	updateInventory(itemToAdd)

func updateInventory(itemToAdd):
	var invBox = get_child(0)
	invBox.add_child(itemToAdd)
	pass
