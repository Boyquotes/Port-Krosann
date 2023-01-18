extends Node


enum Harbors {
	Krosann
	Soradar
	Toladar
	Alandar
	Winslorien
	Akadesh
	Tanderheim
	Garemalan
	Marein
	Forand
	Toshir
	Shotar
}

const Names = {
	Harbors.Krosann: "Port Krosann",
	Harbors.Soradar: "Port Soradar",
	Harbors.Toladar: "Port Toladar",
	Harbors.Alandar: "Port Alandar",
	Harbors.Winslorien: "Winslorien",
	Harbors.Akadesh: "Akadesh",
	Harbors.Tanderheim: "Tanderheim",
	Harbors.Garemalan: "Garemalan",
	Harbors.Marein: "Marein",
	Harbors.Forand: "Forand",
	Harbors.Toshir: "Toshir",
	Harbors.Shotar: "Shotar"  
}

var current = Harbors.Krosann

func reset():
	current = Harbors.Krosann
