extends Node

enum Ships {
	Pinnace
	Sloop
	Brig
	Barc
	Fluyt
	Corvette
	Frigate
	Galleon
	Carrack
	Caravel
	Liner
}

var Types = {
	Ships.Pinnace: Pinnace,
	Ships.Sloop: Sloop,
	Ships.Brig: Brig,
	Ships.Barc: Barc,
	Ships.Fluyt: Fluyt,
	Ships.Corvette: Corvette,
	Ships.Frigate: Frigate,
	Ships.Galleon: Galleon,
	Ships.Carrack: Carrack,
	Ships.Caravel: Caravel,
	Ships.Liner: Liner
}

var current:ShipBase = Types[Ships.Pinnace].new()
var minHpToSetSail = 0.3
var minCrewToSetSail = 0.5
var hireCost = 41
var crewWagesPerDay = 0.4

class ShipBase:
	pass

class Pinnace extends ShipBase:
	var name = "Pinnace"
	var texture:Texture = load("res://assets/images/ships/01-Pinnace.png")
	var maxCargo = 120
	var currCargo = 0
	var maxHp = 100
	var currHp = 100
	var maxCrew = 40
	var currCrew = 40
	var speed = 8
	var upkeep = 50
	var cost = 10000

class Sloop extends ShipBase:
	var name = "Sloop"
	var texture:Texture = load("res://assets/images/ships/02-Sloop.png")
	var maxCargo = 200
	var currCargo = 0
	var maxHp = 110
	var currHp = 110
	var maxCrew = 70
	var currCrew = 70
	var speed = 10
	var upkeep = 55
	var cost = 19000

class Brig extends ShipBase:
	var name = "Brig"
	var texture:Texture = load("res://assets/images/ships/03-Brig.png")
	var maxCargo = 240
	var currCargo = 0
	var maxHp = 140
	var currHp = 140
	var maxCrew = 80
	var currCrew = 80
	var speed = 11
	var upkeep = 70
	var cost = 27000

class Barc extends ShipBase:
	var name = "Barc"
	var texture:Texture = load("res://assets/images/ships/04-Barc.png")
	var maxCargo = 250
	var currCargo = 0
	var maxHp = 150
	var currHp = 150
	var maxCrew = 100
	var currCrew = 100
	var speed = 12
	var upkeep = 75
	var cost = 36000

class Fluyt extends ShipBase:
	var name = "Fluyt"
	var texture:Texture = load("res://assets/images/ships/05-Fluyt.png")
	var maxCargo = 350
	var currCargo = 0
	var maxHp = 220
	var currHp = 220
	var maxCrew = 80
	var currCrew = 80
	var speed = 10
	var upkeep = 110
	var cost = 40000

class Corvette extends ShipBase:
	var name = "Corvette"
	var texture:Texture = load("res://assets/images/ships/06-Corvette.png")
	var maxCargo = 350
	var currCargo = 0
	var maxHp = 200
	var currHp = 200
	var maxCrew = 120
	var currCrew = 120
	var speed = 12
	var upkeep = 100
	var cost = 60000

class Frigate extends ShipBase:
	var name = "Frigate"
	var texture:Texture = load("res://assets/images/ships/07-Frigate.png")
	var maxCargo = 400
	var currCargo = 0
	var maxHp = 220
	var currHp = 220
	var maxCrew = 130
	var currCrew = 130
	var speed = 11
	var upkeep = 110
	var cost = 70000

class Galleon extends ShipBase:
	var name = "Galleon"
	var texture:Texture = load("res://assets/images/ships/08-Galleon.png")
	var maxCargo = 600
	var currCargo = 0
	var maxHp = 280
	var currHp = 280
	var maxCrew = 180
	var currCrew = 180
	var speed = 10
	var upkeep = 140
	var cost = 120000

class Carrack extends ShipBase:
	var name = "Carrack"
	var texture:Texture = load("res://assets/images/ships/09-Carrack.png")
	var maxCargo = 550
	var currCargo = 0
	var maxHp = 320
	var currHp = 320
	var maxCrew = 200
	var currCrew = 200
	var speed = 12
	var upkeep = 160
	var cost = 140000

class Caravel extends ShipBase:
	var name = "Caravel"
	var texture:Texture = load("res://assets/images/ships/10-Caravel.png")
	var maxCargo = 500
	var currCargo = 0
	var maxHp = 300
	var currHp = 300
	var maxCrew = 200
	var currCrew = 200
	var speed = 11
	var upkeep = 150
	var cost = 160000

class Liner extends ShipBase:
	var name = "Liner"
	var texture:Texture = load("res://assets/images/ships/11-Liner.png")
	var maxCargo = 400
	var currCargo = 0
	var maxHp = 340
	var currHp = 340
	var maxCrew = 300
	var currCrew = 300
	var speed = 14
	var upkeep = 160
	var cost = 200000

func reset():
	current = Types[Ships.Pinnace].new()
