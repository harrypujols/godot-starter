extends Control

onready var player = get_node('../../../player')
var is_dialog_open = false
	
func _input(event):
	if Input.is_action_pressed('ui_accept') && global.entered_dialog_zone:
		if is_dialog_open == false:
			is_dialog_open = true
			player.state = 'interact'
			$dialog_box.popup_centered()
			$dialog_box.init()


func _on_dialog_box_popup_hide():
	is_dialog_open = false
