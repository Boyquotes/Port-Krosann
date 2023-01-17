extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$HarborName/Label.text = Harbor.Names[Harbor.current]
	$Day/Label.text = str(Player.currentDay)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Gold/Label.text = str(Player.gold)


func _on_MapButton_button_up():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://screens/worldmap/WorldMap.tscn")
