extends KinematicBody2D

export var speed = 200
var velocity = Vector2()
var direction = 'down'
var state = 'idle'

func top_down_move():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		direction = 'right'
		get_node('./player_sprite').set_flip_h(false)
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		direction = 'right'
		get_node('./player_sprite').set_flip_h(true)
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
		direction = 'down'
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		direction = 'up'
	velocity = velocity.normalized() * speed

func frame_animation():
	if velocity != Vector2(0,0):
		state = 'walk'
	else:
		state = 'idle'
		
	var player_animation = get_node('./player_animation')
	var current_animation = state + '_' + direction
	
	if player_animation.current_animation != current_animation:
		player_animation.play(current_animation)

func _physics_process(delta):
	top_down_move()
	move_and_slide(velocity)
	frame_animation()