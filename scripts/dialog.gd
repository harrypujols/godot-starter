extends Control

onready var player = get_node('../../../player')
var is_dialog_open = false
	
func _input(event):
	if Input.is_action_pressed('ui_accept') && global.entered_dialog_zone:
		if is_dialog_open == false:
			player.state = 'interact'
			$dialog_box.popup_centered()
