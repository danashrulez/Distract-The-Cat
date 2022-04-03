extends AnimatedSprite



func _ready():
	add_to_group("Game")

func idle_animation():
	play("idle")

func dizzy_animation():
	play("dizzy")

func push_animation():
	play("push")

func after_push():
	play("after_push")





func _on_push_sound_delay_timeout():
	$push_sound.play()
