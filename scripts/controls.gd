extends Node

var known_controllers = []
onready var button_icons = get_tree().get_nodes_in_group('button_icons')

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

func hide_button_icons():
	for button in button_icons:
		button.hide()
		
func _process(delta):
	if Input.is_action_pressed('ui_right'):
		hide_button_icons()
		$right.show()
	if Input.is_action_pressed('ui_left'):
		hide_button_icons()
		$left.show()
	if Input.is_action_pressed('ui_down'):
		hide_button_icons()
		$down.show()
	if Input.is_action_pressed('ui_up'):
		hide_button_icons()
		$up.show()