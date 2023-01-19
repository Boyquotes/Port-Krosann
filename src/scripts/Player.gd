extends Node


var gold:int = 5000
var currentDay:int = 1
var daysToWin:int = 1000
var goldToWin:int = 5000000
var goalMissed = false
var goalReached = false

var grainAmount:int = 0
var cornAmount:int = 0
var vegetablesAmount:int = 0
var fruitsAmount:int = 0
var cottonAmount:int = 0
var beerAmount:int = 0
var bricksAmount:int = 0
var cocoaAmount:int = 0
var coffeeAmount:int = 0
var sugarAmount:int = 0
var tabaccoAmount:int = 0 
var silkAmount:int = 0

var grainAveragePrice:int = 0
var cornAveragePrice:int = 0
var vegetablesAveragePrice:int = 0
var fruitsAveragePrice:int = 0
var cottonAveragePrice:int = 0
var beerAveragePrice:int = 0
var bricksAveragePrice:int = 0
var cocoaAveragePrice:int = 0
var coffeeAveragePrice:int = 0
var sugarAveragePrice:int = 0
var tabaccoAveragePrice:int = 0 
var silkAveragePrice:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func reset():
	gold = 5000
	currentDay = 1
	grainAmount = 0
	cornAmount = 0
	vegetablesAmount = 0
	fruitsAmount = 0
	cottonAmount = 0
	beerAmount = 0
	bricksAmount = 0
	cocoaAmount = 0
	coffeeAmount = 0
	sugarAmount = 0
	tabaccoAmount = 0 
	silkAmount = 0

	grainAveragePrice = 0
	cornAveragePrice = 0
	vegetablesAveragePrice = 0
	fruitsAveragePrice = 0
	cottonAveragePrice = 0
	beerAveragePrice = 0
	bricksAveragePrice = 0
	cocoaAveragePrice = 0
	coffeeAveragePrice = 0
	sugarAveragePrice = 0
	tabaccoAveragePrice = 0 
	silkAveragePrice = 0
	
