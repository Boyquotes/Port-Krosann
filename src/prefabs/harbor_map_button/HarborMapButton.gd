extends Control

export(Harbor.Harbors) var harbor = Harbor.Harbors.Krosann

var myMarket: Market.Market

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = Harbor.Names[harbor]
	_initMarket()
	_handle_ship_icon()
	_calcNeeds()

func _initMarket():
	if harbor == Harbor.Harbors.Krosann:
		myMarket = Market.krosannMarket
	elif harbor == Harbor.Harbors.Soradar:
		myMarket = Market.soradarMarket
	elif harbor == Harbor.Harbors.Toladar:
		myMarket = Market.toladarMarket
	elif harbor == Harbor.Harbors.Alandar:
		myMarket = Market.alandarMarket
	elif harbor == Harbor.Harbors.Winslorien:
		myMarket = Market.winslorienMarket
	elif harbor == Harbor.Harbors.Akadesh:
		myMarket = Market.akadeshMarket
	elif harbor == Harbor.Harbors.Tanderheim:
		myMarket = Market.tanderheimMarket
	elif harbor == Harbor.Harbors.Garemalan:
		myMarket = Market.garemalanMarket
	elif harbor == Harbor.Harbors.Marein:
		myMarket = Market.mareinMarket
	elif harbor == Harbor.Harbors.Forand:
		myMarket = Market.forandMarket
	elif harbor == Harbor.Harbors.Toshir:
		myMarket = Market.toshirMarket
	elif harbor == Harbor.Harbors.Shotar:
		myMarket = Market.shotarMarket

func _calcNeeds():
	if myMarket.grainSellPrice > myMarket.grainBasePrice * Market.goodSellTreshhold:
		$Need.visible = true
		$Need.texture = load("res://assets/images/goods/goods-grain.png")
		$NeedTooltip.hint_tooltip = Harbor.Names[harbor] + " needs Grain"
		$NeedTooltip.visible = true
	elif myMarket.cornSellPrice > myMarket.cornBasePrice * Market.goodSellTreshhold:
		$Need.visible = true
		$Need.texture = load("res://assets/images/goods/goods-corn.png")
		$NeedTooltip.hint_tooltip = Harbor.Names[harbor] + " needs Corn"
		$NeedTooltip.visible = true
	elif myMarket.vegetablesSellPrice > myMarket.vegetablesBasePrice * Market.goodSellTreshhold:
		$Need.visible = true
		$Need.texture = load("res://assets/images/goods/goods-vegetables.png")	
		$NeedTooltip.hint_tooltip = Harbor.Names[harbor] + " needs Vegetables"
		$NeedTooltip.visible = true
	elif myMarket.fruitsSellPrice > myMarket.fruitsBasePrice * Market.goodSellTreshhold:
		$Need.visible = true
		$Need.texture = load("res://assets/images/goods/goods-fruits.png")
		$NeedTooltip.hint_tooltip = Harbor.Names[harbor] + " needs Fruits"
		$NeedTooltip.visible = true
	elif myMarket.cottonSellPrice > myMarket.cottonBasePrice * Market.goodSellTreshhold:
		$Need.visible = true
		$Need.texture = load("res://assets/images/goods/goods-cotton.png")
		$NeedTooltip.hint_tooltip = Harbor.Names[harbor] + " needs Cotton"
		$NeedTooltip.visible = true
	elif myMarket.beerSellPrice > myMarket.beerBasePrice * Market.goodSellTreshhold:
		$Need.visible = true
		$Need.texture = load("res://assets/images/goods/goods-beer.png")
		$NeedTooltip.hint_tooltip = Harbor.Names[harbor] + " needs Beer"
		$NeedTooltip.visible = true
	elif myMarket.bricksSellPrice > myMarket.bricksBasePrice * Market.goodSellTreshhold:
		$Need.visible = true
		$Need.texture = load("res://assets/images/goods/goods-bricks.png")
		$NeedTooltip.hint_tooltip = Harbor.Names[harbor] + " needs Bricks"
		$NeedTooltip.visible = true
	elif myMarket.cocoaSellPrice > myMarket.cocoaBasePrice * Market.goodSellTreshhold:
		$Need.visible = true
		$Need.texture = load("res://assets/images/goods/goods-cocoa.png")
		$NeedTooltip.hint_tooltip = Harbor.Names[harbor] + " needs Cocoa"
		$NeedTooltip.visible = true
	elif myMarket.coffeeSellPrice > myMarket.coffeeBasePrice * Market.goodSellTreshhold:
		$Need.visible = true
		$Need.texture = load("res://assets/images/goods/goods-coffee.png")
		$NeedTooltip.hint_tooltip = Harbor.Names[harbor] + " needs Coffee"
		$NeedTooltip.visible = true
	elif myMarket.sugarSellPrice > myMarket.sugarBasePrice * Market.goodSellTreshhold:
		$Need.visible = true
		$Need.texture = load("res://assets/images/goods/goods-sugar.png")
		$NeedTooltip.hint_tooltip = Harbor.Names[harbor] + " needs Sugar"
		$NeedTooltip.visible = true
	elif myMarket.tabaccoSellPrice > myMarket.tabaccoBasePrice * Market.goodSellTreshhold:
		$Need.visible = true
		$Need.texture = load("res://assets/images/goods/goods-tabacco.png")
		$NeedTooltip.visible = true
		$NeedTooltip.hint_tooltip = Harbor.Names[harbor] + " needs Tabacco"
	elif myMarket.silkSellPrice > myMarket.silkBasePrice * Market.goodSellTreshhold:
		$Need.visible = true
		$Need.texture = load("res://assets/images/goods/goods-silk.png")
		$NeedTooltip.visible = true
		$NeedTooltip.hint_tooltip = Harbor.Names[harbor] + " needs Silk"
	else:
		$Need.visible = false
		$NeedTooltip.visible = false

func _handle_ship_icon():
	if Harbor.current == harbor:
		$ShipIcon.visible = true
	else:
		$ShipIcon.visible = false

func _on_Button_button_up():
	if not Harbor.current == harbor:
		if float(Ship.current.currHp)/float(Ship.current.maxHp) < Ship.minHpToSetSail:
			Global.infoWindowTitle = "Hp"
			Global.infoWindowText = "Not enough ship hp. You have to repair your ship first."
			get_parent().get_parent().get_node("InfoWindow").show()
			return
		if float(Ship.current.currCrew)/float(Ship.current.maxCrew) < Ship.minCrewToSetSail:
			Global.infoWindowTitle = "Crew"
			Global.infoWindowText = "Not enough crew. Hire more crew first."
			get_parent().get_parent().get_node("InfoWindow").show()
			return

		Harbor.current = harbor
		Market.current = myMarket
		Market.recalcMarketsExceptFor(harbor)
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://screens/sailing/Sailing.tscn")
	else:
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://screens/harbor/Harbor.tscn")
