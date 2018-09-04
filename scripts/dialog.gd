extends Container

onready var player = get_node('../../../player')
var dialog = 'closed'
var entered_dialog_zone = false

func _ready():
	player.connect('open_global_dialog', self, '_open')
	player.connect('close_global_dialog', self, '_close')

func _open():
	entered_dialog_zone = true
	print('entered dialog area')

func _close():
	entered_dialog_zone = false
	print('exited dialog area')
	
func _input(event):
	if Input.is_action_pressed('ui_accept') && entered_dialog_zone == true:
		match dialog:
			'open':
				self.visible = false
				dialog = 'closed'
				player.state = 'move'
			'closed':
				self.visible = true
				dialog = 'open'
				player.state = 'interact'
				$typing_effect.start()
			_:
				print(dialog)
