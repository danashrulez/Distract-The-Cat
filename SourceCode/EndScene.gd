extends Control



func _ready():
	add_to_group("Game")


func _on_Play_pressed():
	$Play/AudioStreamPlayer.play()
	get_tree().change_scene("res://MainScene/Main.tscn")


func _on_Quit_pressed():
	$Quit/AudioStreamPlayer.play()
	get_tree().quit()
