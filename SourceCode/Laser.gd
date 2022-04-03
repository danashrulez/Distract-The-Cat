extends KinematicBody2D


export var fall_gravity_scale := 250.0
export var low_jump_gravity_scale := 180.0
export var jump_power := 500.0
var jump_released = false

#Physics
var velocity = Vector2()
var earth_gravity = 9.807 # m/s^2
export var gravity_scale := 180.0


func _physics_process(delta):
	var screen_size = get_viewport_rect().size
	position.y = clamp(position.y, 0, 600)

	
	if Input.is_action_just_released("jump"):
		jump_released = true


	velocity += Vector2.DOWN * earth_gravity * gravity_scale * delta

	
	if velocity.y > 0: 
		velocity += Vector2.DOWN * earth_gravity * fall_gravity_scale * delta 

	elif velocity.y < 0 && jump_released: 
		velocity += Vector2.DOWN * earth_gravity * low_jump_gravity_scale * delta


	if Input.is_action_just_pressed("jump"): 
		velocity = Vector2.UP * jump_power #Normal Jump action
		jump_released = false
		if $jump_sound.playing == false:
			$jump_sound.play()

	velocity = move_and_slide(velocity, Vector2.UP) 


