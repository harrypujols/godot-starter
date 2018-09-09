extends Container

onready var player = get_node('../../player')
var dialog_open = 0

func _ready():
	pass

func dialog_system():
	$dialog_text.reset()
	$typing_effect.start()
	if $dialog_text.next_page == 'end':
		dialog_open = 1
		$dialog_text.next_page = $dialog_text.page

	
func _input(event):
	if Input.is_action_pressed('ui_accept') && global.entered_dialog_zone:
		match dialog_open:
			1:
				self.visible = false
				player.state = 'move'
				dialog_open = 0	
			0:
				self.visible = true
				player.state = 'interact'
				dialog_system()
