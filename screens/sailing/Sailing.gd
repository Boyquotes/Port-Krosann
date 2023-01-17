extends Control

var daysPassed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	calcDaysPassed()
	calcShipDamage()
	calcCrewTravelLoss()
	$AnimationPlayer.play("Rotate")
	$Label.text = "Sailing to " + Harbor.Names[Harbor.current]

func calcDaysPassed():
	randomize()
	daysPassed = randi()%8+4
	Player.currentDay += daysPassed

func calcShipDamage():
	Ship.current.currHp -= int(daysPassed*0.8)

func calcCrewTravelLoss():
	Ship.current.currCrew -= int(daysPassed*0.1)

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Rotate":
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://screens/harbor/Harbor.tscn")
