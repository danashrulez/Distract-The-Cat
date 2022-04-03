extends TextureProgress



func _ready():
	add_to_group("Game")
	value = max_value

func _physics_process(delta):
	value += step


func distracted():
	value +=10
	
