extends Control

func _on_BtnToShip_button_up():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://screens/harbor/Harbor.tscn")
