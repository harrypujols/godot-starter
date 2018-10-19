extends HBoxContainer

func _ready():
	$accept.text_color = 'grey'
	$accept.refresh_label()
	
	$cancel.text_color = 'grey'
	$cancel.refresh_label()
	
#	set_icons()
	
#	self.rect_scale = Vector2(.6, .6)

#func set_icons():
#	input.icon_color = 'light'
#	$input_accept.input_icon = input.input_accept
#	$input_accept.refresh_icon()
#	$input_cancel.input_icon = input.input_cancel
#	$input_cancel.refresh_icon()
#
#func _input(event):
#	set_icons()