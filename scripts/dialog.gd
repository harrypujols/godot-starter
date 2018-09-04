extends Container

onready var player = get_node('../../../player')
var dialog = 'closed'
var dialog_active = false

func _ready():
	player.connect('open_global_dialog', self, '_open')
	player.connect('close_global_dialog', self, '_close')

func _open():
	dialog_active = true
	print('entered dialog area')

func _close():
	dialog_active = false
	print('exited dialog area')
	
func _input(event):
	if Input.is_action_pressed('ui_accept') && dialog_active == true:
		match dialog:
			'open':
				self.visible = false
				dialog = 'closed'
				player.state = 'move'
			'closed':
				self.visible = true
				dialog = 'open'
				player.state = 'interact'
			_:
				print(dialog)
