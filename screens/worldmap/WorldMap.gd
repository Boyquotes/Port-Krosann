extends Control

#func _handle_ship_icon():
#	# hide all ship icons
#	$HarborButtons/PortKrosann/ShipIcon.visible = false
#	$HarborButtons/PortSoradar/ShipIcon.visible = false
#	$HarborButtons/PortToladar/ShipIcon.visible = false
#	$HarborButtons/PortAlandar/ShipIcon.visible = false
#
#	if Global.currHarbor == Global.Harbors.Krosann:
#		$HarborButtons/PortKrosann/ShipIcon.visible = true
#	elif Global.currHarbor == Global.Harbors.Soradar:
#		$HarborButtons/PortSoradar/ShipIcon.visible = true
#	elif Global.currHarbor == Global.Harbors.Toladar:
#		$HarborButtons/PortToladar/ShipIcon.visible = true
#	elif Global.currHarbor == Global.Harbors.Alandar:
#		$HarborButtons/PortAlandar/ShipIcon.visible = true
#
#func _on_BtnPortKrosann_button_up():
#	if not Global.currHarbor == Global.Harbors.Krosann:
#		Global.currHarbor = Global.Harbors.Krosann
#		Global.currMarket = Global.krosannMarket
#		Global.recalcMarketsExceptFor(Global.Harbors.Krosann)
#		# warning-ignore:return_value_discarded
#		get_tree().change_scene("res://screens/sailing/Sailing.tscn")
#	else:
#		# warning-ignore:return_value_discarded
#		get_tree().change_scene("res://screens/harbor/Harbor.tscn")
#
#func _on_BtnPortSoradar_button_up():
#	if not Global.currHarbor == Global.Harbors.Soradar:
#		Global.currHarbor = Global.Harbors.Soradar
#		Global.currMarket = Global.soradarMarket
#		Global.recalcMarketsExceptFor(Global.Harbors.Soradar)
#		# warning-ignore:return_value_discarded
#		get_tree().change_scene("res://screens/sailing/Sailing.tscn")
#	else:
#		# warning-ignore:return_value_discarded
#		get_tree().change_scene("res://screens/harbor/Harbor.tscn")
#
#func _on_BtnPortTaladar_button_up():
#	if not Global.currHarbor == Global.Harbors.Toladar:
#		Global.currHarbor = Global.Harbors.Toladar
#		Global.currMarket = Global.toladarMarket
#		Global.recalcMarketsExceptFor(Global.Harbors.Toladar)
#		# warning-ignore:return_value_discarded
#		get_tree().change_scene("res://screens/sailing/Sailing.tscn")
#	else:
#		# warning-ignore:return_value_discarded
#		get_tree().change_scene("res://screens/harbor/Harbor.tscn")
#
#func _on_BtnPortAlandar_button_up():
#	if not Global.currHarbor == Global.Harbors.Alandar:
#		Global.currHarbor = Global.Harbors.Alandar
#		Global.currMarket = Global.alandarMarket
#		Global.recalcMarketsExceptFor(Global.Harbors.Alandar)
#		# warning-ignore:return_value_discarded
#		get_tree().change_scene("res://screens/sailing/Sailing.tscn")
#	else:
#		# warning-ignore:return_value_discarded
#		get_tree().change_scene("res://screens/harbor/Harbor.tscn")

func _on_BtnToShip_button_up():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://screens/harbor/Harbor.tscn")



