extends HBoxContainer

func _ready():
	$input_accept.input_icon = global.key.inverse.spacebar
	$input_accept.input_text = 'next'
	$input_accept.text_color = 'grey'
	
	$input_accept.set('rect/scale', .5)
	$input_accept.refresh_icon()
	$input_accept.refresh_label()
	
	$input_cancel.input_icon = global.key.inverse.delete
	$input_cancel.input_text = 'cancel'
	$input_cancel.text_color = 'grey'
	
	$input_cancel.refresh_icon()
	$input_cancel.refresh_label()
