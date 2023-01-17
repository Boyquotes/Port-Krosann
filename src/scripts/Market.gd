extends Node

var krosannMarket = Market.new()
var soradarMarket = Market.new()
var toladarMarket = Market.new()
var alandarMarket = Market.new()
var winslorienMarket = Market.new()
var akadeshMarket = Market.new()
var tanderheimMarket = Market.new()
var garemalanMarket = Market.new()
var mareinMarket = Market.new()
var forandMarket = Market.new()
var toshirMarket = Market.new()
var shotarMarket = Market.new()

# Make sure these match
var current = krosannMarket
var buySellAmount = 1

# Threshhold for calculation of whether it is a really good buy/sell price (just for visual purposes)
const goodSellTreshhold = 1.7
const goodBuyTreshhold = 0.8

func recalcMarketsExceptFor(harbor:int):
	if not harbor == Harbor.Harbors.Krosann:
		 krosannMarket = Market.new()
	if not harbor == Harbor.Harbors.Soradar:
		soradarMarket = Market.new()
	if not harbor == Harbor.Harbors.Toladar:
		toladarMarket = Market.new()
	if not harbor == Harbor.Harbors.Alandar:
		alandarMarket = Market.new()
	if not harbor == Harbor.Harbors.Winslorien:
		winslorienMarket = Market.new()
	if not harbor == Harbor.Harbors.Akadesh:
		akadeshMarket = Market.new()
	if not harbor == Harbor.Harbors.Tanderheim:
		tanderheimMarket = Market.new()
	if not harbor == Harbor.Harbors.Garemalan:
		garemalanMarket = Market.new()
	if not harbor == Harbor.Harbors.Marein:
		mareinMarket = Market.new()
	if not harbor == Harbor.Harbors.Forand:
		forandMarket = Market.new()
	if not harbor == Harbor.Harbors.Toshir:
		toshirMarket = Market.new()
	if not harbor == Harbor.Harbors.Shotar:
		shotarMarket = Market.new()

class Market:
	const grainBasePrice = 28
	const cornBasePrice = 32
	const vegetablesBasePrice = 46
	const fruitsBasePrice = 48
	const cottonBasePrice = 52
	const beerBasePrice = 68
	const bricksBasePrice = 74
	const cocoaBasePrice = 92
	const coffeeBasePrice = 98
	const sugarBasePrice = 114
	const tabaccoBasePrice = 152
	const silkBasePrice = 196
	
	var grainRandPrice = 0
	var cornRandPrice = 0
	var vegetablesRandPrice = 0
	var fruitsRandPrice = 0
	var cottonRandPrice = 0
	var beerRandPrice = 0
	var bricksRandPrice = 0
	var cocoaRandPrice = 0
	var coffeeRandPrice = 0
	var sugarRandPrice = 0
	var tabaccoRandPrice = 0
	var silkRandPrice = 0
	
	var grainSellPrice = 0
	var cornSellPrice = 0
	var vegetablesSellPrice = 0
	var fruitsSellPrice = 0
	var cottonSellPrice = 0
	var beerSellPrice = 0
	var bricksSellPrice = 0
	var cocoaSellPrice = 0
	var coffeeSellPrice = 0
	var sugarSellPrice = 0
	var tabaccoSellPrice = 0
	var silkSellPrice = 0
	
	var grainBuyPrice = 0
	var cornBuyPrice = 0
	var vegetablesBuyPrice = 0
	var fruitsBuyPrice = 0
	var cottonBuyPrice = 0
	var beerBuyPrice = 0
	var bricksBuyPrice = 0
	var cocoaBuyPrice = 0
	var coffeeBuyPrice = 0
	var sugarBuyPrice = 0
	var tabaccoBuyPrice = 0
	var silkBuyPrice = 0

	# The difference between buy- and sell price in percent
	const buySellMargin = 20
	
	const minAmount = 0
	# The maximum amount that will have effect on the price
	const maxAmount = 200
	const endpoint = 0.1

	var grainAmount:int
	var cornAmount:int
	var vegetablesAmount:int
	var fruitsAmount:int
	var cottonAmount:int
	var beerAmount:int
	var bricksAmount:int
	var cocoaAmount:int
	var coffeeAmount:int
	var sugarAmount:int
	var tabaccoAmount:int
	var silkAmount:int
	
	func _init():
		randomizeGoods()
		updatePrices()
	
	func randomizeGoods():
		randomize()
		# Amounts
		grainAmount = randi()%maxAmount+minAmount
		cornAmount = randi()%maxAmount+minAmount
		vegetablesAmount = randi()%maxAmount+minAmount
		fruitsAmount = randi()%maxAmount+minAmount
		cottonAmount = randi()%maxAmount+minAmount
		beerAmount = randi()%maxAmount+minAmount
		bricksAmount = randi()%maxAmount+minAmount
		cocoaAmount = randi()%maxAmount+minAmount
		coffeeAmount = randi()%maxAmount+minAmount
		sugarAmount = randi()%maxAmount+minAmount
		tabaccoAmount = randi()%maxAmount+minAmount
		silkAmount = randi()%maxAmount+minAmount
		# Prices
		var factor = 0.05
		grainRandPrice = randi()%(grainBasePrice+(int(grainBasePrice*factor)))+(grainBasePrice-(int(grainBasePrice*factor)))
		cornRandPrice = randi()%(cornBasePrice+(int(cornBasePrice*factor)))+(cornBasePrice-(int(cornBasePrice*factor)))
		vegetablesRandPrice = randi()%(vegetablesBasePrice-(int(vegetablesBasePrice*factor)))+(vegetablesBasePrice-(int(vegetablesBasePrice*factor)))
		fruitsRandPrice = randi()%(fruitsBasePrice+(int(fruitsBasePrice*factor)))+(fruitsBasePrice-(int(fruitsBasePrice*factor)))
		cottonRandPrice = randi()%(cottonBasePrice+(int(cottonBasePrice*factor)))+(cottonBasePrice-(int(cottonBasePrice*factor)))
		beerRandPrice = randi()%(beerBasePrice+(int(beerBasePrice*factor)))+(beerBasePrice-(int(beerBasePrice*factor)))
		bricksRandPrice = randi()%(bricksBasePrice+(int(bricksBasePrice*factor)))+(bricksBasePrice-(int(bricksBasePrice*factor)))
		cocoaRandPrice = randi()%(cocoaBasePrice+(int(cocoaBasePrice*factor)))+(cocoaBasePrice-(int(cocoaBasePrice*factor)))
		coffeeRandPrice = randi()%(coffeeBasePrice+(int(coffeeBasePrice*factor)))+(coffeeBasePrice-(int(coffeeBasePrice*factor)))
		sugarRandPrice = randi()%(sugarBasePrice+(int(sugarBasePrice*factor)))+(sugarBasePrice-(int(sugarBasePrice*factor)))
		tabaccoRandPrice = randi()%(tabaccoBasePrice+(int(tabaccoBasePrice*factor)))+(tabaccoBasePrice-(int(tabaccoBasePrice*factor)))
		silkRandPrice = randi()%(silkBasePrice+(int(silkBasePrice*factor)))+(silkBasePrice-(int(silkBasePrice*factor)))

	func updatePrices():
		var rawPrice:float
		# grain
		rawPrice = grainRandPrice - endpoint * grainAmount
		#warning-ignore:integer_division
		grainBuyPrice = int(rawPrice + ((rawPrice/100) * (buySellMargin/2)))
		#warning-ignore:integer_division
		grainSellPrice = int(rawPrice - ((rawPrice/100) * (buySellMargin/2)))
		# corn
		rawPrice = cornRandPrice - endpoint * cornAmount
		#warning-ignore:integer_division
		cornBuyPrice = int(rawPrice + ((rawPrice/100) * (buySellMargin/2)))
		#warning-ignore:integer_division
		cornSellPrice = int(rawPrice - ((rawPrice/100) * (buySellMargin/2)))
		# vegetables
		rawPrice = vegetablesRandPrice - endpoint * vegetablesAmount
		#warning-ignore:integer_division
		vegetablesBuyPrice = int(rawPrice + ((rawPrice/100) * (buySellMargin/2)))
		#warning-ignore:integer_division
		vegetablesSellPrice = int(rawPrice - ((rawPrice/100) * (buySellMargin/2)))
		# fruit
		rawPrice = fruitsRandPrice - endpoint * fruitsAmount
		#warning-ignore:integer_division
		fruitsBuyPrice = int(rawPrice + ((rawPrice/100) * (buySellMargin/2)))
		#warning-ignore:integer_division
		fruitsSellPrice = int(rawPrice - ((rawPrice/100) * (buySellMargin/2)))
		# cotton
		rawPrice = cottonRandPrice - endpoint * cottonAmount
		#warning-ignore:integer_division
		cottonBuyPrice = int(rawPrice + ((rawPrice/100) * (buySellMargin/2)))
		#warning-ignore:integer_division
		cottonSellPrice = int(rawPrice - ((rawPrice/100) * (buySellMargin/2)))
		# beer
		rawPrice = beerRandPrice - endpoint * beerAmount
		#warning-ignore:integer_division
		beerBuyPrice = int(rawPrice + ((rawPrice/100) * (buySellMargin/2)))
		#warning-ignore:integer_division
		beerSellPrice = int(rawPrice - ((rawPrice/100) * (buySellMargin/2)))
		# bricks
		rawPrice = bricksRandPrice - endpoint * bricksAmount
		#warning-ignore:integer_division
		bricksBuyPrice = int(rawPrice + ((rawPrice/100) * (buySellMargin/2)))
		#warning-ignore:integer_division
		bricksSellPrice = int(rawPrice - ((rawPrice/100) * (buySellMargin/2)))
		# cocoa
		rawPrice = cocoaRandPrice - endpoint * cocoaAmount
		#warning-ignore:integer_division
		cocoaBuyPrice = int(rawPrice + ((rawPrice/100) * (buySellMargin/2)))
		#warning-ignore:integer_division
		cocoaSellPrice = int(rawPrice - ((rawPrice/100) * (buySellMargin/2)))
		# coffee
		rawPrice = coffeeRandPrice - endpoint * coffeeAmount
		#warning-ignore:integer_division
		coffeeBuyPrice = int(rawPrice + ((rawPrice/100) * (buySellMargin/2)))
		#warning-ignore:integer_division
		coffeeSellPrice = int(rawPrice - ((rawPrice/100) * (buySellMargin/2)))
		# sugar
		rawPrice = sugarRandPrice - endpoint * sugarAmount
		#warning-ignore:integer_division
		sugarBuyPrice = int(rawPrice + ((rawPrice/100) * (buySellMargin/2)))
		#warning-ignore:integer_division
		sugarSellPrice = int(rawPrice - ((rawPrice/100) * (buySellMargin/2)))
		# tabacco
		rawPrice = tabaccoRandPrice - endpoint * tabaccoAmount
		#warning-ignore:integer_division
		tabaccoBuyPrice = int(rawPrice + ((rawPrice/100) * (buySellMargin/2)))
		#warning-ignore:integer_division
		tabaccoSellPrice = int(rawPrice - ((rawPrice/100) * (buySellMargin/2)))
		# silk
		rawPrice = silkRandPrice - endpoint * silkAmount
		#warning-ignore:integer_division
		silkBuyPrice = int(rawPrice + ((rawPrice/100) * (buySellMargin/2)))
		#warning-ignore:integer_division
		silkSellPrice = int(rawPrice - ((rawPrice/100) * (buySellMargin/2)))
