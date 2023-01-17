extends Control

func _ready():
	$TitleLabel.text = Global.infoWindowTitle
	$TextLabel.text = Global.infoWindowText

func show():
	$TitleLabel.text = Global.infoWindowTitle
	$TextLabel.text = Global.infoWindowText
	visible = true

func _on_OkButton_button_up():
	visible = false
