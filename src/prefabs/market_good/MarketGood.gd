extends Control

export (Good.Goods) var kind: int = Good.Goods.Grain

# Called when the node enters the scene tree for the first time.
func _ready():
	if (kind == Good.Goods.Grain):
		$Texture.texture_normal = load("res://assets/images/goods/goods-grain.png")
	if (kind == Good.Goods.Corn):
		$Texture.texture_normal = load("res://assets/images/goods/goods-corn.png")
	if (kind == Good.Goods.Vegetables):
		$Texture.texture_normal = load("res://assets/images/goods/goods-vegetables.png")
	if (kind == Good.Goods.Fruits):
		$Texture.texture_normal = load("res://assets/images/goods/goods-fruits.png")
	if (kind == Good.Goods.Cotton):
		$Texture.texture_normal = load("res://assets/images/goods/goods-cotton.png")
	if (kind == Good.Goods.Beer):
		$Texture.texture_normal = load("res://assets/images/goods/goods-beer.png")
	if (kind == Good.Goods.Bricks):
		$Texture.texture_normal = load("res://assets/images/goods/goods-bricks.png")
	if (kind == Good.Goods.Cocoa):
		$Texture.texture_normal = load("res://assets/images/goods/goods-cocoa.png")
	if (kind == Good.Goods.Coffee):
		$Texture.texture_normal = load("res://assets/images/goods/goods-coffee.png")
	if (kind == Good.Goods.Sugar):
		$Texture.texture_normal = load("res://assets/images/goods/goods-sugar.png")
	if (kind == Good.Goods.Tabacco):
		$Texture.texture_normal = load("res://assets/images/goods/goods-tabacco.png")
	if (kind == Good.Goods.Silk):
		$Texture.texture_normal = load("res://assets/images/goods/goods-silk.png")
	
	syncLabels()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func syncLabels():
	if kind == Good.Goods.Grain:
		$Texture.hint_tooltip = "Grain"
		$Sell/Amount.text = str(Market.current.grainAmount)
		$Sell/Price.text = str(Market.current.grainSellPrice)
		$Buy/Amount.text = str(Player.grainAmount)
		$Buy/Price.text = str(Market.current.grainBuyPrice)
		
		if Market.current.grainAmount <= 0:
			$Sell/Amount.modulate = Color( 1, 0.5, 0.5, 1 )
		else:
			$Sell/Amount.modulate = Color( 1, 1, 1, 1 )
		
		if Market.current.grainSellPrice > Market.current.grainBasePrice * Market.goodSellTreshhold:
			$Sell/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Sell/Price.modulate = Color( 1, 1, 1, 1 )
		if Market.current.grainBuyPrice < Market.current.grainBasePrice * Market.goodBuyTreshhold:
			$Buy/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Buy/Price.modulate = Color( 1, 1, 1, 1 )

		if Player.grainAveragePrice > 0:
			$AveragePriceBg.visible = true
			$AveragePrice.visible = true
			$AveragePrice.text = str(Player.grainAveragePrice)
		else:
			$AveragePriceBg.visible = false
			$AveragePrice.visible = false

	elif kind == Good.Goods.Corn:
		$Texture.hint_tooltip = "Corn"
		$Sell/Amount.text = str(Market.current.cornAmount)
		$Sell/Price.text = str(Market.current.cornSellPrice)
		$Buy/Amount.text = str(Player.cornAmount)
		$Buy/Price.text = str(Market.current.cornBuyPrice)
		
		if Market.current.cornAmount <= 0:
			$Sell/Amount.modulate = Color( 1, 0.5, 0.5, 1 )
		else:
			$Sell/Amount.modulate = Color( 1, 1, 1, 1 )
		
		if Market.current.cornSellPrice > Market.current.cornBasePrice * Market.goodSellTreshhold:
			$Sell/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Sell/Price.modulate = Color( 1, 1, 1, 1 )
		if Market.current.cornBuyPrice < Market.current.cornBasePrice * Market.goodBuyTreshhold:
			$Buy/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Buy/Price.modulate = Color( 1, 1, 1, 1 )

		if Player.cornAveragePrice > 0:
			$AveragePriceBg.visible = true
			$AveragePrice.visible = true
			$AveragePrice.text = str(Player.cornAveragePrice)
		else:
			$AveragePriceBg.visible = false
			$AveragePrice.visible = false

	elif kind == Good.Goods.Vegetables:
		$Texture.hint_tooltip = "Vegetables"
		$Sell/Amount.text = str(Market.current.vegetablesAmount)
		$Sell/Price.text = str(Market.current.vegetablesSellPrice)
		$Buy/Amount.text = str(Player.vegetablesAmount)
		$Buy/Price.text = str(Market.current.vegetablesBuyPrice)
		
		if Market.current.vegetablesAmount <= 0:
			$Sell/Amount.modulate = Color( 1, 0.5, 0.5, 1 )
		else:
			$Sell/Amount.modulate = Color( 1, 1, 1, 1 )
			
		if Market.current.vegetablesSellPrice > Market.current.vegetablesBasePrice * Market.goodSellTreshhold:
			$Sell/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Sell/Price.modulate = Color( 1, 1, 1, 1 )
		if (Market.current.vegetablesBuyPrice < Market.current.vegetablesBasePrice * Market.goodBuyTreshhold):
			$Buy/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Buy/Price.modulate = Color( 1, 1, 1, 1 )

		if Player.vegetablesAveragePrice > 0:
			$AveragePriceBg.visible = true
			$AveragePrice.visible = true
			$AveragePrice.text = str(Player.vegetablesAveragePrice)
		else:
			$AveragePriceBg.visible = false
			$AveragePrice.visible = false

	elif kind == Good.Goods.Fruits:
		$Texture.hint_tooltip = "Fruits"
		$Sell/Amount.text = str(Market.current.fruitsAmount)
		$Sell/Price.text = str(Market.current.fruitsSellPrice)
		$Buy/Amount.text = str(Player.fruitsAmount)
		$Buy/Price.text = str(Market.current.fruitsBuyPrice)
		
		if Market.current.fruitsAmount <= 0:
			$Sell/Amount.modulate = Color( 1, 0.5, 0.5, 1 )
		else:
			$Sell/Amount.modulate = Color( 1, 1, 1, 1 )
		
		if Market.current.fruitsSellPrice > Market.current.fruitsBasePrice * Market.goodSellTreshhold:
			$Sell/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Sell/Price.modulate = Color( 1, 1, 1, 1 )
		if (Market.current.fruitsBuyPrice < Market.current.fruitsBasePrice * Market.goodBuyTreshhold):
			$Buy/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Buy/Price.modulate = Color( 1, 1, 1, 1 )

		if Player.fruitsAveragePrice > 0:
			$AveragePriceBg.visible = true
			$AveragePrice.visible = true
			$AveragePrice.text = str(Player.fruitsAveragePrice)
		else:
			$AveragePriceBg.visible = false
			$AveragePrice.visible = false

	elif kind == Good.Goods.Cotton:
		$Texture.hint_tooltip = "Cotton"
		$Sell/Amount.text = str(Market.current.cottonAmount)
		$Sell/Price.text = str(Market.current.cottonSellPrice)
		$Buy/Amount.text = str(Player.cottonAmount)
		$Buy/Price.text = str(Market.current.cottonBuyPrice)
		
		if Market.current.cottonAmount <= 0:
			$Sell/Amount.modulate = Color( 1, 0.5, 0.5, 1 )
		else:
			$Sell/Amount.modulate = Color( 1, 1, 1, 1 )
		
		if Market.current.cottonSellPrice > Market.current.cottonBasePrice * Market.goodSellTreshhold:
			$Sell/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Sell/Price.modulate = Color( 1, 1, 1, 1 )
		if (Market.current.cottonBuyPrice < Market.current.cottonBasePrice * Market.goodBuyTreshhold):
			$Buy/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Buy/Price.modulate = Color( 1, 1, 1, 1 )

		if Player.cottonAveragePrice > 0:
			$AveragePriceBg.visible = true
			$AveragePrice.visible = true
			$AveragePrice.text = str(Player.cottonAveragePrice)
		else:
			$AveragePriceBg.visible = false
			$AveragePrice.visible = false

	elif kind == Good.Goods.Beer:
		$Texture.hint_tooltip = "Beer"
		$Sell/Amount.text = str(Market.current.beerAmount)
		$Sell/Price.text = str(Market.current.beerSellPrice)
		$Buy/Amount.text = str(Player.beerAmount)
		$Buy/Price.text = str(Market.current.beerBuyPrice)
		
		if Market.current.beerAmount <= 0:
			$Sell/Amount.modulate = Color( 1, 0.5, 0.5, 1 )
		else:
			$Sell/Amount.modulate = Color( 1, 1, 1, 1 )
		
		if Market.current.beerSellPrice > Market.current.beerBasePrice * Market.goodSellTreshhold:
			$Sell/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Sell/Price.modulate = Color( 1, 1, 1, 1 )
		if (Market.current.beerBuyPrice < Market.current.beerBasePrice * Market.goodBuyTreshhold):
			$Buy/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Buy/Price.modulate = Color( 1, 1, 1, 1 )

		if Player.beerAveragePrice > 0:
			$AveragePriceBg.visible = true
			$AveragePrice.visible = true
			$AveragePrice.text = str(Player.beerAveragePrice)
		else:
			$AveragePriceBg.visible = false
			$AveragePrice.visible = false

	elif kind == Good.Goods.Bricks:
		$Texture.hint_tooltip = "Bricks"
		$Sell/Amount.text = str(Market.current.bricksAmount)
		$Sell/Price.text = str(Market.current.bricksSellPrice)
		$Buy/Amount.text = str(Player.bricksAmount)
		$Buy/Price.text = str(Market.current.bricksBuyPrice)
		
		if Market.current.bricksAmount <= 0:
			$Sell/Amount.modulate = Color( 1, 0.5, 0.5, 1 )
		else:
			$Sell/Amount.modulate = Color( 1, 1, 1, 1 )
		
		if Market.current.bricksSellPrice > Market.current.bricksBasePrice * Market.goodSellTreshhold:
			$Sell/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Sell/Price.modulate = Color( 1, 1, 1, 1 )
		if (Market.current.bricksBuyPrice < Market.current.bricksBasePrice * Market.goodBuyTreshhold):
			$Buy/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Buy/Price.modulate = Color( 1, 1, 1, 1 )

		if Player.bricksAveragePrice > 0:
			$AveragePriceBg.visible = true
			$AveragePrice.visible = true
			$AveragePrice.text = str(Player.bricksAveragePrice)
		else:
			$AveragePriceBg.visible = false
			$AveragePrice.visible = false

	elif kind == Good.Goods.Cocoa:
		$Texture.hint_tooltip = "Cocoa"
		$Sell/Amount.text = str(Market.current.cocoaAmount)
		$Sell/Price.text = str(Market.current.cocoaSellPrice)
		$Buy/Amount.text = str(Player.cocoaAmount)
		$Buy/Price.text = str(Market.current.cocoaBuyPrice)
		
		if Market.current.cocoaAmount <= 0:
			$Sell/Amount.modulate = Color( 1, 0.5, 0.5, 1 )
		else:
			$Sell/Amount.modulate = Color( 1, 1, 1, 1 )
		
		if Market.current.cocoaSellPrice > Market.current.cocoaBasePrice * Market.goodSellTreshhold:
			$Sell/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Sell/Price.modulate = Color( 1, 1, 1, 1 )
		if (Market.current.cocoaBuyPrice < Market.current.cocoaBasePrice * Market.goodBuyTreshhold):
			$Buy/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Buy/Price.modulate = Color( 1, 1, 1, 1 )

		if Player.cocoaAveragePrice > 0:
			$AveragePriceBg.visible = true
			$AveragePrice.visible = true
			$AveragePrice.text = str(Player.cocoaAveragePrice)
		else:
			$AveragePriceBg.visible = false
			$AveragePrice.visible = false

	elif kind == Good.Goods.Coffee:
		$Texture.hint_tooltip = "Coffee"
		$Sell/Amount.text = str(Market.current.coffeeAmount)
		$Sell/Price.text = str(Market.current.coffeeSellPrice)
		$Buy/Amount.text = str(Player.coffeeAmount)
		$Buy/Price.text = str(Market.current.coffeeBuyPrice)
		
		if Market.current.coffeeAmount <= 0:
			$Sell/Amount.modulate = Color( 1, 0.5, 0.5, 1 )
		else:
			$Sell/Amount.modulate = Color( 1, 1, 1, 1 )
		
		if Market.current.coffeeSellPrice > Market.current.coffeeBasePrice * Market.goodSellTreshhold:
			$Sell/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Sell/Price.modulate = Color( 1, 1, 1, 1 )
		if (Market.current.coffeeBuyPrice < Market.current.coffeeBasePrice * Market.goodBuyTreshhold):
			$Buy/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Buy/Price.modulate = Color( 1, 1, 1, 1 )

		if Player.coffeeAveragePrice > 0:
			$AveragePriceBg.visible = true
			$AveragePrice.visible = true
			$AveragePrice.text = str(Player.coffeeAveragePrice)
		else:
			$AveragePriceBg.visible = false
			$AveragePrice.visible = false

	elif kind == Good.Goods.Sugar:
		$Texture.hint_tooltip = "Sugar"
		$Sell/Amount.text = str(Market.current.sugarAmount)
		$Sell/Price.text = str(Market.current.sugarSellPrice)
		$Buy/Amount.text = str(Player.sugarAmount)
		$Buy/Price.text = str(Market.current.sugarBuyPrice)
		
		if Market.current.sugarAmount <= 0:
			$Sell/Amount.modulate = Color( 1, 0.5, 0.5, 1 )
		else:
			$Sell/Amount.modulate = Color( 1, 1, 1, 1 )
		
		if Market.current.sugarSellPrice > Market.current.sugarBasePrice * Market.goodSellTreshhold:
			$Sell/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Sell/Price.modulate = Color( 1, 1, 1, 1 )
		if (Market.current.sugarBuyPrice < Market.current.sugarBasePrice * Market.goodBuyTreshhold):
			$Buy/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Buy/Price.modulate = Color( 1, 1, 1, 1 )

		if Player.sugarAveragePrice > 0:
			$AveragePriceBg.visible = true
			$AveragePrice.visible = true
			$AveragePrice.text = str(Player.sugarAveragePrice)
		else:
			$AveragePriceBg.visible = false
			$AveragePrice.visible = false

	elif kind == Good.Goods.Tabacco:
		$Texture.hint_tooltip = "Tabacco"
		$Sell/Amount.text = str(Market.current.tabaccoAmount)
		$Sell/Price.text = str(Market.current.tabaccoSellPrice)
		$Buy/Amount.text = str(Player.tabaccoAmount)
		$Buy/Price.text = str(Market.current.tabaccoBuyPrice)
		
		if Market.current.tabaccoAmount <= 0:
			$Sell/Amount.modulate = Color( 1, 0.5, 0.5, 1 )
		else:
			$Sell/Amount.modulate = Color( 1, 1, 1, 1 )
		
		if Market.current.tabaccoSellPrice > Market.current.tabaccoBasePrice * Market.goodSellTreshhold:
			$Sell/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Sell/Price.modulate = Color( 1, 1, 1, 1 )
		if (Market.current.tabaccoBuyPrice < Market.current.tabaccoBasePrice * Market.goodBuyTreshhold):
			$Buy/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Buy/Price.modulate = Color( 1, 1, 1, 1 )

		if Player.tabaccoAveragePrice > 0:
			$AveragePriceBg.visible = true
			$AveragePrice.visible = true
			$AveragePrice.text = str(Player.tabaccoAveragePrice)
		else:
			$AveragePriceBg.visible = false
			$AveragePrice.visible = false

	elif kind == Good.Goods.Silk:
		$Texture.hint_tooltip = "Silk"
		$Sell/Amount.text = str(Market.current.silkAmount)
		$Sell/Price.text = str(Market.current.silkSellPrice)
		$Buy/Amount.text = str(Player.silkAmount)
		$Buy/Price.text = str(Market.current.silkBuyPrice)
		
		if Market.current.silkAmount <= 0:
			$Sell/Amount.modulate = Color( 1, 0.5, 0.5, 1 )
		else:
			$Sell/Amount.modulate = Color( 1, 1, 1, 1 )
		
		if Market.current.silkSellPrice > Market.current.silkBasePrice * Market.goodSellTreshhold:
			$Sell/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Sell/Price.modulate = Color( 1, 1, 1, 1 )
		if (Market.current.silkBuyPrice < Market.current.silkBasePrice * Market.goodBuyTreshhold):
			$Buy/Price.modulate = Color( 0.5, 1, 0.5, 1 )
		else:
			$Buy/Price.modulate = Color( 1, 1, 1, 1 )

		if Player.silkAveragePrice > 0:
			$AveragePriceBg.visible = true
			$AveragePrice.visible = true
			$AveragePrice.text = str(Player.silkAveragePrice)
		else:
			$AveragePriceBg.visible = false
			$AveragePrice.visible = false

	else:
		pass

func _on_ButtonSell_button_up():
	if kind == Good.Goods.Grain:
		if Player.grainAmount > 0:
			var sellAmount = Market.buySellAmount
			if Player.grainAmount < sellAmount:
				sellAmount = Player.grainAmount

			Player.gold += Market.current.grainSellPrice * sellAmount
			Market.current.grainAmount += sellAmount
			Player.grainAmount -= sellAmount
			Ship.current.currCargo -= sellAmount
			if Player.grainAmount <= 0:
				Player.grainAveragePrice = 0

	elif kind == Good.Goods.Corn:
		if Player.cornAmount > 0:
			var sellAmount = Market.buySellAmount
			if Player.cornAmount < sellAmount:
				sellAmount = Player.cornAmount

			Player.gold += Market.current.cornSellPrice * sellAmount
			Market.current.cornAmount += sellAmount
			Player.cornAmount -= sellAmount
			Ship.current.currCargo -= sellAmount
			if Player.cornAmount <= 0:
				Player.cornAveragePrice = 0
	
	elif kind == Good.Goods.Vegetables:
		if Player.vegetablesAmount > 0:
			var sellAmount = Market.buySellAmount
			if Player.vegetablesAmount < sellAmount:
				sellAmount = Player.vegetablesAmount

			Player.gold += Market.current.vegetablesSellPrice * sellAmount
			Market.current.vegetablesAmount += sellAmount
			Player.vegetablesAmount -= sellAmount
			Ship.current.currCargo -= sellAmount
			if Player.vegetablesAmount <= 0:
				Player.vegetablesAveragePrice = 0

	elif kind == Good.Goods.Fruits:
		if Player.fruitsAmount > 0:
			var sellAmount = Market.buySellAmount
			if Player.fruitsAmount < sellAmount:
				sellAmount = Player.fruitsAmount

			Player.gold += Market.current.fruitsSellPrice * sellAmount
			Market.current.fruitsAmount += sellAmount
			Player.fruitsAmount -= sellAmount
			Ship.current.currCargo -= sellAmount
			if Player.fruitsAmount <= 0:
				Player.fruitsAveragePrice = 0

	elif kind == Good.Goods.Cotton:
		if Player.cottonAmount > 0:
			var sellAmount = Market.buySellAmount
			if Player.cottonAmount < sellAmount:
				sellAmount = Player.cottonAmount

			Player.gold += Market.current.cottonSellPrice * sellAmount
			Market.current.cottonAmount += sellAmount
			Player.cottonAmount -= sellAmount
			Ship.current.currCargo -= sellAmount
			if Player.cottonAmount <= 0:
				Player.cottonAveragePrice = 0

	elif kind == Good.Goods.Beer:
		if Player.beerAmount > 0:
			var sellAmount = Market.buySellAmount
			if Player.beerAmount < sellAmount:
				sellAmount = Player.beerAmount

			Player.gold += Market.current.beerSellPrice * sellAmount
			Market.current.beerAmount += sellAmount
			Player.beerAmount -= sellAmount
			Ship.current.currCargo -= sellAmount
			if Player.beerAmount <= 0:
				Player.beerAveragePrice = 0

	elif kind == Good.Goods.Bricks:
		if Player.bricksAmount > 0:
			var sellAmount = Market.buySellAmount
			if Player.bricksAmount < sellAmount:
				sellAmount = Player.bricksAmount

			Player.gold += Market.current.bricksSellPrice * sellAmount
			Market.current.bricksAmount += sellAmount
			Player.bricksAmount -= sellAmount
			Ship.current.currCargo -= sellAmount
			if Player.bricksAmount <= 0:
				Player.bricksAveragePrice = 0

	elif kind == Good.Goods.Cocoa:
		if Player.cocoaAmount > 0:
			var sellAmount = Market.buySellAmount
			if Player.cocoaAmount < sellAmount:
				sellAmount = Player.cocoaAmount

			Player.gold += Market.current.cocoaSellPrice * sellAmount
			Market.current.cocoaAmount += sellAmount
			Player.cocoaAmount -= sellAmount
			Ship.current.currCargo -= sellAmount
			if Player.cocoaAmount <= 0:
				Player.cocoaAveragePrice = 0

	elif kind == Good.Goods.Coffee:
		if Player.coffeeAmount > 0:
			var sellAmount = Market.buySellAmount
			if Player.coffeeAmount < sellAmount:
				sellAmount = Player.coffeeAmount

			Player.gold += Market.current.coffeeSellPrice * sellAmount
			Market.current.coffeeAmount += sellAmount
			Player.coffeeAmount -= sellAmount
			Ship.current.currCargo -= sellAmount
			if Player.coffeeAmount <= 0:
				Player.coffeeAveragePrice = 0

	elif kind == Good.Goods.Sugar:
		if Player.sugarAmount > 0:
			var sellAmount = Market.buySellAmount
			if Player.sugarAmount < sellAmount:
				sellAmount = Player.sugarAmount

			Player.gold += Market.current.sugarSellPrice * sellAmount
			Market.current.sugarAmount += sellAmount
			Player.sugarAmount -= sellAmount
			Ship.current.currCargo -= sellAmount
			if Player.sugarAmount <= 0:
				Player.sugarAveragePrice = 0

	elif kind == Good.Goods.Tabacco:
		if Player.tabaccoAmount > 0:
			var sellAmount = Market.buySellAmount
			if Player.tabaccoAmount < sellAmount:
				sellAmount = Player.tabaccoAmount

			Player.gold += Market.current.tabaccoSellPrice * sellAmount
			Market.current.tabaccoAmount += sellAmount
			Player.tabaccoAmount -= sellAmount
			Ship.current.currCargo -= sellAmount
			if Player.tabaccoAmount <= 0:
				Player.tabaccoAveragePrice = 0

	elif kind == Good.Goods.Silk:
		if Player.silkAmount > 0:
			var sellAmount = Market.buySellAmount
			if Player.silkAmount < sellAmount:
				sellAmount = Player.silkAmount

			Player.gold += Market.current.silkSellPrice * sellAmount
			Market.current.silkAmount += sellAmount
			Player.silkAmount -= sellAmount
			Ship.current.currCargo -= sellAmount
			if Player.silkAmount <= 0:
				Player.silkAveragePrice = 0

	else:
		pass
	
	Market.current.updatePrices()
	syncLabels()

func _on_ButtonBuy_button_up():
	if kind == Good.Goods.Grain:
		if Ship.current.currCargo + Market.buySellAmount <= Ship.current.maxCargo:
			if Player.gold >= Market.current.grainBuyPrice * Market.buySellAmount and Market.current.grainAmount >= Market.buySellAmount:
				Player.gold -= Market.current.grainBuyPrice * Market.buySellAmount
				Market.current.grainAmount -= Market.buySellAmount
				Player.grainAmount += Market.buySellAmount
				Ship.current.currCargo += Market.buySellAmount
				if Player.grainAveragePrice > 0:
					Player.grainAveragePrice = (Player.grainAveragePrice + Market.current.grainBuyPrice) / 2
				else:
					Player.grainAveragePrice = Market.current.grainBuyPrice

	elif kind == Good.Goods.Corn:
		if Ship.current.currCargo + Market.buySellAmount <= Ship.current.maxCargo:
			if Player.gold >= Market.current.cornBuyPrice * Market.buySellAmount and Market.current.cornAmount >= Market.buySellAmount:
				Player.gold -= Market.current.cornBuyPrice * Market.buySellAmount
				Market.current.cornAmount -= Market.buySellAmount
				Player.cornAmount += Market.buySellAmount
				Ship.current.currCargo += Market.buySellAmount
				if Player.cornAveragePrice > 0:
					Player.cornAveragePrice = (Player.cornAveragePrice + Market.current.cornBuyPrice) / 2
				else:
					Player.cornAveragePrice = Market.current.cornBuyPrice

	elif kind == Good.Goods.Vegetables:
		if Ship.current.currCargo + Market.buySellAmount <= Ship.current.maxCargo:
			if Player.gold >= Market.current.vegetablesBuyPrice * Market.buySellAmount and Market.current.vegetablesAmount >= Market.buySellAmount:
				Player.gold -= Market.current.vegetablesBuyPrice * Market.buySellAmount
				Market.current.vegetablesAmount -= Market.buySellAmount
				Player.vegetablesAmount += Market.buySellAmount
				Ship.current.currCargo += Market.buySellAmount
				if Player.vegetablesAveragePrice > 0:
					Player.vegetablesAveragePrice = (Player.vegetablesAveragePrice + Market.current.vegetablesBuyPrice) / 2
				else:
					Player.vegetablesAveragePrice = Market.current.vegetablesBuyPrice

	elif kind == Good.Goods.Fruits:
		if Ship.current.currCargo + Market.buySellAmount <= Ship.current.maxCargo:
			if Player.gold >= Market.current.fruitsBuyPrice * Market.buySellAmount and Market.current.fruitsAmount >= Market.buySellAmount:
				Player.gold -= Market.current.fruitsBuyPrice * Market.buySellAmount
				Market.current.fruitsAmount -= Market.buySellAmount
				Player.fruitsAmount += Market.buySellAmount
				Ship.current.currCargo += Market.buySellAmount
				if Player.fruitsAveragePrice > 0:
					Player.fruitsAveragePrice = (Player.fruitsAveragePrice + Market.current.fruitsBuyPrice) / 2
				else:
					Player.fruitsAveragePrice = Market.current.fruitsBuyPrice

	elif kind == Good.Goods.Cotton:
		if Ship.current.currCargo + Market.buySellAmount <= Ship.current.maxCargo:
			if Player.gold >= Market.current.cottonBuyPrice *Market.buySellAmount and Market.current.cottonAmount >= Market.buySellAmount:
				Player.gold -= Market.current.cottonBuyPrice * Market.buySellAmount
				Market.current.cottonAmount -= Market.buySellAmount
				Player.cottonAmount += Market.buySellAmount
				Ship.current.currCargo += Market.buySellAmount
				if Player.cottonAveragePrice > 0:
					Player.cottonAveragePrice = (Player.cottonAveragePrice + Market.current.cottonBuyPrice) / 2
				else:
					Player.cottonAveragePrice = Market.current.cottonBuyPrice

	elif kind == Good.Goods.Beer:
		if Ship.current.currCargo + Market.buySellAmount <= Ship.current.maxCargo:
			if Player.gold >= Market.current.beerBuyPrice * Market.buySellAmount and Market.current.beerAmount >= Market.buySellAmount:
				Player.gold -= Market.current.beerBuyPrice * Market.buySellAmount
				Market.current.beerAmount -= Market.buySellAmount
				Player.beerAmount += Market.buySellAmount
				Ship.current.currCargo += Market.buySellAmount
				if Player.beerAveragePrice > 0:
					Player.beerAveragePrice = (Player.beerAveragePrice + Market.current.beerBuyPrice) / 2
				else:
					Player.beerAveragePrice = Market.current.beerBuyPrice

	elif kind == Good.Goods.Bricks:
		if Ship.current.currCargo + Market.buySellAmount <= Ship.current.maxCargo:
			if Player.gold >= Market.current.bricksBuyPrice * Market.buySellAmount and Market.current.bricksAmount >= Market.buySellAmount:
				Player.gold -= Market.current.bricksBuyPrice * Market.buySellAmount
				Market.current.bricksAmount -= Market.buySellAmount
				Player.bricksAmount += Market.buySellAmount
				Ship.current.currCargo += Market.buySellAmount
				if Player.bricksAveragePrice > 0:
					Player.bricksAveragePrice = (Player.bricksAveragePrice + Market.current.bricksBuyPrice) / 2
				else:
					Player.bricksAveragePrice = Market.current.bricksBuyPrice

	elif kind == Good.Goods.Cocoa:
		if Ship.current.currCargo + Market.buySellAmount <= Ship.current.maxCargo:
			if Player.gold >= Market.current.cocoaBuyPrice * Market.buySellAmount and Market.current.cocoaAmount >= Market.buySellAmount:
				Player.gold -= Market.current.cocoaBuyPrice * Market.buySellAmount
				Market.current.cocoaAmount -= Market.buySellAmount
				Player.cocoaAmount += Market.buySellAmount
				Ship.current.currCargo += Market.buySellAmount
				if Player.cocoaAveragePrice > 0:
					Player.cocoaAveragePrice = (Player.cocoaAveragePrice + Market.current.cocoaBuyPrice) / 2
				else:
					Player.cocoaAveragePrice = Market.current.cocoaBuyPrice

	elif kind == Good.Goods.Coffee:
		if Ship.current.currCargo + Market.buySellAmount <= Ship.current.maxCargo:
			if Player.gold >= Market.current.coffeeBuyPrice * Market.buySellAmount and Market.current.coffeeAmount >= Market.buySellAmount:
				Player.gold -= Market.current.coffeeBuyPrice * Market.buySellAmount
				Market.current.coffeeAmount -= Market.buySellAmount
				Player.coffeeAmount += Market.buySellAmount
				Ship.current.currCargo += Market.buySellAmount
				if Player.coffeeAveragePrice > 0:
					Player.coffeeAveragePrice = (Player.coffeeAveragePrice + Market.current.coffeeBuyPrice) / 2
				else:
					Player.coffeeAveragePrice = Market.current.coffeeBuyPrice

	elif kind == Good.Goods.Sugar:
		if Ship.current.currCargo + Market.buySellAmount <= Ship.current.maxCargo:
			if Player.gold >= Market.current.sugarBuyPrice * Market.buySellAmount and Market.current.sugarAmount >= Market.buySellAmount:
				Player.gold -= Market.current.sugarBuyPrice * Market.buySellAmount
				Market.current.sugarAmount -= Market.buySellAmount
				Player.sugarAmount += Market.buySellAmount
				Ship.current.currCargo += Market.buySellAmount
				if Player.sugarAveragePrice > 0:
					Player.sugarAveragePrice = (Player.sugarAveragePrice + Market.current.sugarBuyPrice) / 2
				else:
					Player.sugarAveragePrice = Market.current.sugarBuyPrice

	elif kind == Good.Goods.Tabacco:
		if Ship.current.currCargo + Market.buySellAmount <= Ship.current.maxCargo:
			if Player.gold >= Market.current.tabaccoBuyPrice * Market.buySellAmount and Market.current.tabaccoAmount >= Market.buySellAmount:
				Player.gold -= Market.current.tabaccoBuyPrice * Market.buySellAmount
				Market.current.tabaccoAmount -= Market.buySellAmount
				Player.tabaccoAmount += Market.buySellAmount
				Ship.current.currCargo += Market.buySellAmount
				if Player.tabaccoAveragePrice > 0:
					Player.tabaccoAveragePrice = (Player.tabaccoAveragePrice + Market.current.tabaccoBuyPrice) / 2
				else:
					Player.tabaccoAveragePrice = Market.current.tabaccoBuyPrice

	elif kind == Good.Goods.Silk:
		if Ship.current.currCargo + Market.buySellAmount <= Ship.current.maxCargo:
			if Player.gold >= Market.current.silkBuyPrice * Market.buySellAmount and Market.current.silkAmount >= Market.buySellAmount:
				Player.gold -= Market.current.silkBuyPrice * Market.buySellAmount
				Market.current.silkAmount -= Market.buySellAmount
				Player.silkAmount += Market.buySellAmount
				Ship.current.currCargo += Market.buySellAmount
				if Player.silkAveragePrice > 0:
					Player.silkAveragePrice = (Player.silkAveragePrice + Market.current.silkBuyPrice) / 2
				else:
					Player.silkAveragePrice = Market.current.silkBuyPrice

	Market.current.updatePrices()
	syncLabels()
