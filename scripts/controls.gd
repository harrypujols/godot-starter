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
			
	else:
		print('controller disconnected')
