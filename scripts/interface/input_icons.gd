extends Node

const icon = {
	'a': 'a',
	'b': 'b',
	'y': 'y',
	'x': 'x',
	'square': '[',
	'circle': 'o',
	'triangle': 't',
	'button': '0',
	'select': 's',
	'start': '>',
	'arrow_key': '^',
	'key': 'k',
	'delete': 'd',
	'enter': '<',
	'spacebar': 'u',
	'esc': 'e',
	'coin': '$',
	'alert': '!'
}

const direction = {
		up = {
			rotation_degrees = 0
		},
		
		down = {
			rotation_degrees = 180
		},
		
		left = {
			rotation_degrees = -90
		},
		
		right = {
			rotation_degrees = 90
		}
}

var input_accept
var input_cancel

func set_controller_icons():
	if Input.is_joy_known(0):
		match Input.get_joy_name(0):
			'XInput Gamepad':
				input_accept = icon.a
				input_cancel = icon.b
			'PS3 Controller', 'PS4 Controller':
				input_accept = icon.x
				input_cancel = icon.circle
			_:
				input_accept = icon.b
				input_cancel = icon.a

func set_keyboard_icons():
	input_accept = icon.spacebar
	input_cancel = icon.delete

func _input(event):
	if (event is InputEventJoypadButton) or (event is InputEventJoypadMotion):
		set_controller_icons()
	else:
		set_keyboard_icons()
		
func _ready():
	Input.connect('joy_connection_changed', self, '_on_joy_connection_changed')
