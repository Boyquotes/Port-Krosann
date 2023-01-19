extends Control


func _ready():
	$Bg00.visible = true
	$AnimationPlayer.play("00")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "00":
		$Text/Label.text = "It has always been your dream to sail the open sea..."
		$AnimationPlayer.play("01_move")
	if anim_name == "01_move":
		$AnimationPlayer.play("01_fade")
		$Text/Label.text = "On your 16th birthday your father gave you gold for a new ship..."
	if anim_name == "01_fade":
		$AnimationPlayer.play("02_move")
	if anim_name == "02_move":
		$Text/Label.text = "on the next day you went to the Shipyard and bought yourself a new ship..."
		$AnimationPlayer.play("img01_fadein")
	if anim_name == "img01_fadein":
		$AnimationPlayer.play("img01_fadeout")
	if anim_name == "img01_fadeout":
		$AnimationPlayer.play("02_fade")
		$Text/Label.text = "You father wants you to sail the open sea and earn 5 million gold within the next 3 years (1000 days)..."
	if anim_name == "02_fade":
		$AnimationPlayer.play("03_move")
	if anim_name == "03_move":
		$Text/Label.text = "But if loose to much gold, the journey will be over..."
		$AnimationPlayer.play("img02_fadein")
	if anim_name == "img02_fadein":
		$AnimationPlayer.play("last")
	if anim_name == "last":
		$Text/Label.text = ""
		$AnimationPlayer.play("good_luck")
	if anim_name == "good_luck":
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://screens/harbor/Harbor.tscn")

func _on_BeginBtn_button_up():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://screens/harbor/Harbor.tscn")
