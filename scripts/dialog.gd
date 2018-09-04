extends Container

onready var player = get_node('../../../player')
var dialog_open = 0
var current_page = 0
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
		match dialog_open:
			1:
				self.visible = false
				player.state = 'move'
				dialog_open = 0	
			0:
				self.visible = true
				player.state = 'interact'
				var content_size = $dialog_text.content.size()
				$dialog_text.page = current_page
				$dialog_text.reset()
				$typing_effect.start()
				current_page += 1
						
				if current_page >= content_size:
					current_page = 0
					$dialog_text.reset()
					dialog_open = 1
