extends Node2D
var randPlate2 = null
var randx = 0
var DistractionMeter = 100
var neg_check = false
var rng = RandomNumberGenerator.new()
signal end_actions
var end_time
func _ready():
	add_to_group("Game")


func _physics_process(delta):
	distraction_decrease()
	if DistractionMeter <= 0:
		set_physics_process(false)
		emit_signal("end_actions")
		
	
#		get_tree().call_group("Game","push_animation")
#		get_tree().call_group("Game","after_push")
#		get_tree().quit() NEED TO END GAME HERE
		

func distraction_increase():
	DistractionMeter += 10

func distraction_decrease():
	DistractionMeter -=0.3

func random_plate_selector():
	if randPlate2 != null:
		randPlate2.get_child(0).disabled = true
		randPlate2.get_child(1).play("idle")
		randPlate2.get_child(2).enabled = false
	rng.randomize()
	var randno = rng.randi_range(1,6)
	if randx == randno:
		rng.randomize()
	else:
		randx = randno
	var randPlate = find_node("DistractionPlates%s" % randno)
	randPlate2 = randPlate
	randPlate.get_child(0).disabled = false   
	randPlate.get_child(1).play("selected")
	randPlate.get_child(2).enabled = true
	
	

func _on_Timer_timeout():
	random_plate_selector()


func _on_Main_end_actions():
	$Timer.stop()
	$Laser.queue_free()
	get_tree().call_group("Game","push_animation")
	$Game_UI.set_process(false)
	$Bungus/push_sound_delay.start()
	$waterglass/AnimationPlayer.play("fall")
	$Bungus/push_check_timer.start()


	
func _on_push_check_timer_timeout():
	$waterglass/glass_sound.play()
	get_tree().call_group("Game","after_push")
	$end_game_timer.start()
	
	


func _on_end_game_timer_timeout():
	get_tree().change_scene("res://GameObjects/EndScene.tscn")
