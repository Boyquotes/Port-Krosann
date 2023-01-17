extends Node2D

func _process(_delta):
	$Content/Ship/ShipImage.texture = Ship.current.texture
	$Content/Ship/NameLabel.text = Ship.current.name
	$Content/HpBar/ValueLabel.text = str(Ship.current.currHp) + "/" + str(Ship.current.maxHp)
	$Content/CrewBar/ValueLabel.text = str(Ship.current.currCrew) + "/" + str(Ship.current.maxCrew)
	$Content/CargoBar/ValueLabel.text = str(Ship.current.currCargo) + "/" + str(Ship.current.maxCargo)
	$Content/Upkeep/Label.text = "Upkeep: " + str(Ship.current.upkeep)
	$Content/Speed/Label.text = "Speed: " + str(Ship.current.speed)
	
	$Content/HpBar/Bar.rect_scale.x = float(Ship.current.currHp)/float(Ship.current.maxHp)
	$Content/CrewBar/Bar.rect_scale.x = float(Ship.current.currCrew)/float(Ship.current.maxCrew)
	$Content/CargoBar/Bar.rect_scale.x = float(Ship.current.currCargo)/float(Ship.current.maxCargo)
	
	$Content/Repair/CostLabel.text = str((Ship.current.maxHp - Ship.current.currHp) * Ship.current.upkeep)
	$Content/Hire/CostLabel.text = str((Ship.current.maxCrew - Ship.current.currCrew) * Ship.hireCost)
	
	if float(Ship.current.currHp)/float(Ship.current.maxHp) < Ship.minHpToSetSail:
		$Content/HpBar/ValueLabel.modulate = Color( 1, 0.6, 0.6, 1 )
	else:
		$Content/HpBar/ValueLabel.modulate = Color( 1, 1, 1, 1 )
	
	if float(Ship.current.currCrew)/float(Ship.current.maxCrew) < Ship.minCrewToSetSail:
		$Content/CrewBar/ValueLabel.modulate = Color( 1, 0.6, 0.6, 1 )
	else:
		$Content/CrewBar/ValueLabel.modulate = Color( 1, 1, 1, 1 )


func _on_RepairBtn_button_up():
	if Player.gold <= 0:
		Global.infoWindowTitle = "Gold"
		Global.infoWindowText = "Not enough gold to repair your ship"
		get_parent().get_node("InfoWindow").show()
		return

	var hpToRepair = Ship.current.maxHp - Ship.current.currHp
	var goldNeeded = Ship.current.upkeep * hpToRepair
	if Player.gold < goldNeeded:
		hpToRepair = int(Player.gold / Ship.current.upkeep)
	Player.gold -= Ship.current.upkeep * hpToRepair

	Ship.current.currHp += hpToRepair
	
	Global.infoWindowTitle = "Repair"
	Global.infoWindowText = str(hpToRepair) + " hp repaired for " + str(Ship.current.upkeep * hpToRepair) + " gold"
	get_parent().get_node("InfoWindow").show()


func _on_HireBtn_button_up():	
	if Player.gold <= 0:
		Global.infoWindowTitle = "Hire"
		Global.infoWindowText = "Not enough gold to hire a crew"
		get_parent().get_node("InfoWindow").show()
		return

	var crewToHire = Ship.current.maxCrew - Ship.current.currCrew
	var goldNeeded = Ship.hireCost * crewToHire
	if Player.gold < goldNeeded:
		crewToHire = int(Player.gold / Ship.hireCost)
	Player.gold -= Ship.hireCost * crewToHire

	Ship.current.currCrew += crewToHire
	
	Global.infoWindowTitle = "Hire"
	Global.infoWindowText = str(crewToHire) + " crew hired for " + str(Ship.hireCost * crewToHire) + " gold"
	get_parent().get_node("InfoWindow").show()
