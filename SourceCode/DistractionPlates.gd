extends Area2D

var DistractionMeter

func _ready():
	$Light2D.enabled = false
	$CollisionShape2D.disabled = true

func _on_DistractionPlates_body_entered(body):
	get_tree().call_group("Game","distraction_increase")
	get_tree().call_group("Game","distracted")
	get_tree().call_group("Game","dizzy_animation")


func _on_DistractionPlates_body_exited(body):
	get_tree().call_group("Game","idle_animation")
