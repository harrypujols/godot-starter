extends Container

func _input(event):
	if Input.is_action_pressed('ui_pause'):
		match global.pause:
			true:
				get_tree().paused = false
				self.visible = false
				global.pause = false
			false:
				get_tree().paused = true
				self.visible = true
				global.pause = true