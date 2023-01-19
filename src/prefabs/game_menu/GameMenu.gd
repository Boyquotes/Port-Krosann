extends Control

func _on_ContinueBtn_button_up():
	visible = false

func _on_StartBtn_button_up():
	Global.resetGameState()
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://screens/intro/Intro.tscn")

func _on_Quit_button_up():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://screens/mainmenu/MainMenu.tscn")
