extends HBoxContainer

func _ready():
	$accept.text_color = 'grey'
	$accept.font_size = 12
	$accept.icon_size = 18
	$accept.refresh_label()
	
	$cancel.text_color = 'grey'
	$cancel.font_size = 12
	$cancel.icon_size = 18
	$cancel.refresh_label()