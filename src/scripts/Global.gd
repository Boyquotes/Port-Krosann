extends Node


var infoWindowText = "No text"
var infoWindowTitle = "No Title"

func resetGameState():
	Good.reset()
	Harbor.reset()
	Market.reset()
	Player.reset()
	Ship.reset()
