extends Node

# icons
const button = {
	
	dark = {
		a = preload('res://sprites/interface/buttons/a_button.png'),
		b = preload('res://sprites/interface/buttons/b_button.png'),
		x = preload('res://sprites/interface/buttons/x_button.png'),
		y = preload('res://sprites/interface/buttons/y_button.png'),
		triangle = preload('res://sprites/interface/buttons/triangle_button.png'),
		square = preload('res://sprites/interface/buttons/square_button.png'),
		circle = preload('res://sprites/interface/buttons/circle_button.png'),
		select = preload('res://sprites/interface/buttons/select_button.png'),
		start = preload('res://sprites/interface/buttons/start_button.png'),
		default = preload('res://sprites/interface/buttons/button.png')
	},
	
	light = {
		a = preload('res://sprites/interface/inverse_buttons/a_button.png'),
		b = preload('res://sprites/interface/inverse_buttons/b_button.png'),
		x = preload('res://sprites/interface/inverse_buttons/x_button.png'),
		y = preload('res://sprites/interface/inverse_buttons/y_button.png'),
		triangle = preload('res://sprites/interface/inverse_buttons/triangle_button.png'),
		square = preload('res://sprites/interface/inverse_buttons/square_button.png'),
		circle = preload('res://sprites/interface/inverse_buttons/circle_button.png'),
		select = preload('res://sprites/interface/inverse_buttons/select_button.png'),
		start = preload('res://sprites/interface/inverse_buttons/start_button.png'),
		default = preload('res://sprites/interface/inverse_buttons/button.png')
	}
}

const key = {
	
	dark = {
		arrow = preload('res://sprites/interface/buttons/arrow_key.png'),
		enter = preload('res://sprites/interface/buttons/enter_key.png'),
		delete = preload('res://sprites/interface/buttons/delete_key.png'),
		escape = preload('res://sprites/interface/buttons/esc_key.png'),
		spacebar = preload('res://sprites/interface/buttons/spacebar.png'),
		bar = preload('res://sprites/interface/buttons/bar_key.png'),
		default = preload('res://sprites/interface/buttons/key.png')
	},
	
	light = {
		arrow = preload('res://sprites/interface/inverse_buttons/arrow_key.png'),
		enter = preload('res://sprites/interface/inverse_buttons/enter_key.png'),
		delete = preload('res://sprites/interface/inverse_buttons/delete_key.png'),
		escape = preload('res://sprites/interface/inverse_buttons/esc_key.png'),
		spacebar = preload('res://sprites/interface/inverse_buttons/spacebar.png'),
		bar = preload('res://sprites/interface/inverse_buttons/bar_key.png'),
		default = preload('res://sprites/interface/inverse_buttons/key.png')
	}
}

var icon_type = 'key'
var icon_color = 'dark'
var input_accept = key[icon_color].spacebar
var input_cancel = key[icon_color].delete_key
var input_pause = key[icon_color].esc_key

var direction = {
		up = {
			icon = key[icon_color].arrow,
			rotation_degrees = 0
		},
		
		down = {
			icon = key[icon_color].arrow,
			rotation_degrees = 180
		},
		
		left = {
			icon = key[icon_color].arrow,
			rotation_degrees = -90
		},
		
		right = {
			icon = key[icon_color].arrow,
			rotation_degrees = 90
		}
	}

func set_keyboard_icons(icon_color):
	input_accept = key[icon_color].spacebar
	input_cancel = key[icon_color].delete_key
	input_pause = key[icon_color].esc_key
	
func set_controller_icons(icon_color):
	if Input.is_joy_known(0):
		match Input.get_joy_name(0):
			'XInput Gamepad':
				input_accept = button[icon_color].a
				input_cancel = button[icon_color].b
			'PS3 Controller', 'PS4 Controller':
				input_accept = button[icon_color].x
				input_cancel = button[icon_color].circle
			_:
				input_accept = button[icon_color].b
				input_cancel = button[icon_color].a
	
func _input(event):
	if (event is InputEventJoypadButton) or (event is InputEventJoypadMotion):
		set_controller_icons(icon_color)
	else:
		set_keyboard_icons(icon_color)
