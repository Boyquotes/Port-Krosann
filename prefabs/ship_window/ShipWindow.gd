extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Content/ShipImage.texture = Ship.current.texture
	$Content/NameLabel.text = Ship.current.name
	$Content/HpBar/ValueLabel.text = str(Ship.current.currHp) + "/" + str(Ship.current.maxHp)
	$Content/CrewBar/ValueLabel.text = str(Ship.current.currCrew) + "/" + str(Ship.current.maxCrew)
	$Content/CargoBar/ValueLabel.text = str(Ship.current.currCargo) + "/" + str(Ship.current.maxCargo)
	$Content/Upkeep/Label.text = "Upkeep: " + str(Ship.current.upkeep)
	$Content/Speed/Label.text = "Speed: " + str(Ship.current.speed)
	
	$Content/HpBar/Bar.rect_scale.x = float(Ship.current.currHp)/float(Ship.current.maxHp)
	$Content/CrewBar/Bar.rect_scale.x = float(Ship.current.currCrew)/float(Ship.current.maxCrew)
	$Content/CargoBar/Bar.rect_scale.x = float(Ship.current.currCargo)/float(Ship.current.maxCargo)
	
	if float(Ship.current.currHp)/float(Ship.current.maxHp) < Ship.minHpToSetSail:
		$Content/HpBar/ValueLabel.modulate = Color( 1, 0.6, 0.6, 1 )
	else:
		$Content/HpBar/ValueLabel.modulate = Color( 1, 1, 1, 1 )
	
	if float(Ship.current.currCrew)/float(Ship.current.maxCrew) < Ship.minCrewToSetSail:
		$Content/CrewBar/ValueLabel.modulate = Color( 1, 0.6, 0.6, 1 )
	else:
		$Content/CrewBar/ValueLabel.modulate = Color( 1, 1, 1, 1 )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Content/CargoBar/ValueLabel.text = str(Ship.current.currCargo) + "/" + str(Ship.current.maxCargo)
	$Content/CargoBar/Bar.rect_scale.x = float(Ship.current.currCargo)/float(Ship.current.maxCargo)
