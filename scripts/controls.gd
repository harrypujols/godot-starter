extends Node

var known_controllers = []
var accept_button = global.key.spacebar
var cancel_button = global.key.delete
var pause_button = global.key.default

func _ready():
	Input.connect('joy_connection_changed', self, '_on_connection_change')

func _on_connection_change(device_id, is_connected):
	if is_connected:
		if Input.is_joy_known(0):
			print(Input.get_joy_name(0) + ' is connected')
			
			match Input.get_joy_name(0):
				'XInput Gamepad':
					accept_button = global.button.a
					cancel_button = global.button.b
				'PS3 Controller', 'PS4 Controller':
					accept_button = global.button.x
					cancel_button = global.button.circle
				_:
					print(Input.get_joy_name(0))
					accept_button = global.button.a
					cancel_button = global.button.b
			
	else:
		print('controller disconnected')

func init():
	if Input.is_action_pressed('ui_right'):
		$action_pressed.set_texture(global.key.arrow)
		$action_pressed.rotation_degrees = 90
	if Input.is_action_pressed('ui_left'):
		$action_pressed.set_texture(global.key.arrow)
		$action_pressed.rotation_degrees = -90
	if Input.is_action_pressed('ui_down'):
		$action_pressed.set_texture(global.key.arrow)
		$action_pressed.rotation_degrees = 180
	if Input.is_action_pressed('ui_up'):
		$action_pressed.set_texture(global.key.arrow)
		$action_pressed.rotation_degrees = 0
	if Input.is_action_just_pressed('ui_accept'):
		$action_pressed.set_texture(accept_button)
		$action_pressed.rotation_degrees = 0
	if Input.is_action_just_pressed('ui_cancel'):
		$action_pressed.set_texture(cancel_button)
		$action_pressed.rotation_degrees = 0
		
func _process(delta):
	init()