extends Control

var daysPassed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	calcDaysPassed()
	calcShipDamage()
	calcCrewTravelLoss()
	calcCrewWages()
	$AnimationPlayer.play("Rotate")
	$LabelHarborName.text = Harbor.Names[Harbor.current]
	$LabelDaysAmount.text = str(daysPassed) + " days "
	$LabelWagesAmount.text = str(int(float(daysPassed) * Ship.crewWagesPerDay * Ship.current.currCrew))

func calcDaysPassed():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	daysPassed = rng.randi_range(16, 24) - Ship.current.speed
	Player.currentDay += daysPassed

func calcShipDamage():
	Ship.current.currHp -= int(daysPassed*0.7)

func calcCrewTravelLoss():
	Ship.current.currCrew -= int(daysPassed*0.2)

func calcCrewWages():
	Player.gold -= int(float(daysPassed) * Ship.crewWagesPerDay * Ship.current.currCrew)

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Rotate":
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://screens/harbor/Harbor.tscn")
