extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Player.gold < -2000:
		Global.infoWindowTitle = "Game Lost"
		Global.infoWindowText = "Your gold reached below -2000 (" + str(Player.gold) + "), you have lost the game! Good luck on your next try!"
		$InfoWindow.show()
		Global.resetGameState()

	$HarborName/Label.text = Harbor.Names[Harbor.current]
	$Day/Label.text = str(Player.currentDay)

	$ShipWindow.visible = true
	$ShipButton.visible = false
	$ShipyardWindow.visible = false
	$ShipyardButton.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Gold/Label.text = str(Player.gold)
	if Player.gold <= 0:
		$Gold/Label.modulate = Color(1, 0.5, 0.5)
	else:
		$Gold/Label.modulate = Color(1, 1, 1)
	
#	if Player.gold <= 0 and float(Ship.current.currHp)/float(Ship.current.maxHp) < Ship.minHpToSetSail:
#		Global.infoWindowTitle = "Game Lost"
#		Global.infoWindowText = "Your gold went negative (" + str(Player.gold) + ") and you cannot affort to repair your ship. Good luck on your next try!"
#		$InfoWindow.show()
#		Global.resetGameState()
#
#	if Player.gold <= 0 and float(Ship.current.currCrew)/float(Ship.current.maxCrew) < Ship.minCrewToSetSail:
#		Global.infoWindowTitle = "Game Lost"
#		Global.infoWindowText = "Your gold went negative (" + str(Player.gold) + ") and you cannot affort to hire enough crew to set sail. Good luck on your next try!"
#		$InfoWindow.show()
#		Global.resetGameState()

	if Player.currentDay >= Player.daysToWin and Player.goalMissed == false:
		Player.goalMissed = true
		Global.infoWindowTitle = "Father"
		Global.infoWindowText = "Your father is disappointed because you didn't reach the goal. You can keep playing or try again."
		$InfoWindow.show()
	elif Player.gold >= Player.goldToWin and Player.goalReached == false:
		Player.goalReached = true
		Global.infoWindowTitle = "Father"
		Global.infoWindowText = "Your father is really proud of you because you reached the goal. You can keep playing or start a new game." 
		$InfoWindow.show()

func _on_MapButton_button_up():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://screens/worldmap/WorldMap.tscn")


func _on_ShipyardButton_button_up():
	$ShipWindow.visible = false
	$ShipButton.visible = true
	$ShipyardWindow.visible = true
	$ShipyardButton.visible = false


func _on_ShipButton_button_up():
	$ShipWindow.visible = true
	$ShipButton.visible = false
	$ShipyardWindow.visible = false
	$ShipyardButton.visible = true


func _on_SettingsButton_button_up():
	$GameMenu.visible = true
