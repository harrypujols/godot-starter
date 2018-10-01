extends HBoxContainer

var accept_button = global.key.inverse.spacebar
var cancel_button = global.key.inverse.delete

func _ready():
	$input_accept.input_text = 'accept'
	$input_accept.text_color = 'grey'
	$input_accept.refresh_label()
	
	$input_cancel.input_text = 'cancel'
	$input_cancel.text_color = 'grey'
	$input_cancel.refresh_label()
	
	set_icons()

func set_icons():
	$input_accept.input_icon = accept_button
	$input_accept.refresh_icon()
	$input_cancel.input_icon = cancel_button
	$input_cancel.refresh_icon()
	
func set_keyboard_icons():
	accept_button = global.key.inverse.spacebar
	cancel_button = global.key.inverse.delete
	
func set_controller_icons():
	if Input.is_joy_known(0):
		match Input.get_joy_name(0):
			'XInput Gamepad':
				accept_button = global.button.inverse.a
				cancel_button = global.button.inverse.b
			'PS3 Controller', 'PS4 Controller':
				accept_button = global.button.inverse.x
				cancel_button = global.button.inverse.circle
			_:
				accept_button = global.button.inverse.b
				cancel_button = global.button.inverse.a
	
func _input(event):
	if (event is InputEventJoypadButton) or (event is InputEventJoypadMotion):
		set_controller_icons()
		set_icons()
	else:
		set_keyboard_icons()
		set_icons()