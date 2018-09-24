extends Node

var known_controllers = []

func _ready():
	Input.connect('joy_connection_changed', self, '_on_connection_change')

func _on_connection_change(device_id, is_connected):
	if is_connected:
		if Input.is_joy_known(0):
			print(Input.get_joy_name(0) + ' is connected')
			
			for controller in known_controllers:
				if controller == Input.get_joy_name(0):
					known_controllers.erase(controller)
			known_controllers.append(Input.get_joy_name(0))
			
			print(known_controllers)
			
			match Input.get_joy_name(0):
				'XInput Gamepad':
					print('is Xbox')
				'PS3 Controller', 'PS4 Controller':
					print('is Playstation')
				_:
					print(Input.get_joy_name(0))
			
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
		
func _process(delta):
	init()