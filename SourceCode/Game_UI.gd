extends Control

var time_start = 0
var time_now = 0
var str_elapsed
func _ready():
	add_to_group("Game")
	time_start = OS.get_unix_time()
	set_process(true)

func _process(delta):
	time_now = OS.get_unix_time()
	var elapsed = time_now - time_start
	var minutes = elapsed / 60
	var seconds = elapsed % 60
	str_elapsed = "%02d:%02d" % [minutes, seconds]
	$Label.text = str_elapsed
