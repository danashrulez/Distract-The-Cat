extends Label



func _ready():
	pass # Replace with function body.


func _on_instruction_fader_timeout():
	$AnimationPlayer.play("Scale")
	$queuefree.start()


func _on_queuefree_timeout():
	queue_free()
