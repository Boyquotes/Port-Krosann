extends Node2D

var selectedShip
var currentSelectionIndex

var ships = [
	Ship.Pinnace,
	Ship.Sloop,
	Ship.Brig,
	Ship.Barc,
	Ship.Fluyt,
	Ship.Corvette,
	Ship.Frigate,
	Ship.Galleon,
	Ship.Carrack,
	Ship.Caravel,
	Ship.Liner,
]


# Called when the node enters the scene tree for the first time.
func _ready():
	currentSelectionIndex = 0
	selectedShip = ships[currentSelectionIndex].new()
	updateContent()

func updateContent():
	$Content/ShipNameLabel.text = selectedShip.name
	$Content/ShipImg.texture = selectedShip.texture
	$Content/Cost/CostLabel.text = str(selectedShip.cost)
	$Content/Desc/HpValue.text = str(selectedShip.maxHp)
	$Content/Desc/CrewValue.text = str(selectedShip.maxCrew)
	$Content/Desc/CargoValue.text = str(selectedShip.maxCargo)
	$Content/Desc/SpeedValue.text = str(selectedShip.speed)
	$Content/Desc/UpkeepValue.text = str(selectedShip.upkeep)
	
	$Content/Navigation/NavNumber.text = str(currentSelectionIndex+1) + "/" + str(len(ships))
	
	if selectedShip.name == Ship.current.name:
		$Content/Buy.visible = false
	else:
		$Content/Buy.visible = true


func _on_LeftBtn_button_up():
	currentSelectionIndex -= 1
	if currentSelectionIndex < 0:
		currentSelectionIndex = len(ships)-1
	selectedShip = ships[currentSelectionIndex].new()
	updateContent()


func _on_RightBtn_button_up():
	currentSelectionIndex += 1
	if currentSelectionIndex >= len(ships):
		currentSelectionIndex = 0
	selectedShip = ships[currentSelectionIndex].new()
	updateContent()

func _on_BuyBtn_button_up():
	if Player.gold < selectedShip.cost:
		Global.infoWindowTitle = "Gold"
		Global.infoWindowText = "Not enough gold to buy a " + str(selectedShip.name) + "!"
		get_parent().get_node("InfoWindow").show()
		return
	
	if Ship.current.currCargo > selectedShip.maxCargo:
		Global.infoWindowTitle = "Cargo"
		Global.infoWindowText = str(selectedShip.name) + " has not enough cargo space to hold your current cargo, sell some goods first."
		get_parent().get_node("InfoWindow").show()
		return
	
	Player.gold -= selectedShip.cost
	Ship.current = selectedShip
	
	Global.infoWindowTitle = "New Ship"
	Global.infoWindowText = "Congratulations, you bought a brand new " + str(selectedShip.name) + "!"
	get_parent().get_node("InfoWindow").show()

	updateContent()
