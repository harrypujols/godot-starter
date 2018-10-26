extends CanvasLayer

var entered_dialog_zone = false

func _input(event):
	if Input.is_action_just_pressed('ui_accept') and entered_dialog_zone:
		$dialog.clicks += 1
		if $dialog.dialog_open == 0:
			$dialog.init()
			
	if Input.is_action_just_pressed('ui_cancel'):
		$dialog.reset_dialog()