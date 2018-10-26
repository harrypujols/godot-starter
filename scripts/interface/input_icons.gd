extends Node

signal icon_changed

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

var default = icon.button
var accept = icon.spacebar
var cancel = icon.delete

func set_controller_icons():
	if Input.is_joy_known(0):
		match Input.get_joy_name(0):
			'XInput Gamepad':
				accept = icon.a
				cancel = icon.b
			'PS3 Controller', 'PS4 Controller':
				accept = icon.x
				cancel = icon.circle
			_:
				accept = icon.b
				cancel = icon.a
		emit_signal('icon_changed')

func set_keyboard_icons():
	accept = icon.spacebar
	cancel = icon.delete
	emit_signal('icon_changed')
		
func _ready():
	if Input.get_connected_joypads().size() > 0:
		set_controller_icons()
	Input.connect('joy_connection_changed', self, '_on_joy_connection_changed')
	
func _on_joy_connection_changed(device_id, connected):
	if connected:
		set_controller_icons()
	else:
		set_keyboard_icons()
