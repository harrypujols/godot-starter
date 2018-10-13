extends KinematicBody2D

onready var player_sprite = get_node('./player_sprite')
onready var player_animation = get_node('./player_animation')
export var speed = 200
var velocity = Vector2()
var direction = 'down'
var frame = 'idle'
signal open_global_dialog
signal close_global_dialog

func _ready():
	pass

func top_down_move():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		direction = 'right'
		player_sprite.set_flip_h(false)
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		direction = 'right'
		player_sprite.set_flip_h(true)
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
		direction = 'down'
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		direction = 'up'
	velocity = velocity.normalized() * speed

func frame_animation():
	if velocity != Vector2(0,0):
		frame = 'walk'
	else:
		frame = 'idle'
		
	var current_animation = frame + '_' + direction
	
	if player_animation.current_animation != current_animation:
		player_animation.play(current_animation)

func _physics_process(delta):
	match global.player.state:
		'move':
			top_down_move()
			move_and_slide(velocity)
			frame_animation()