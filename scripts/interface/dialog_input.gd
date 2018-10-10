extends HBoxContainer

onready var input = get_node('/root/stage/input')

func _ready():
	$input_accept.input_text = 'accept'
	$input_accept.text_color = 'grey'
	$input_accept.refresh_label()
	
	$input_cancel.input_text = 'cancel'
	$input_cancel.text_color = 'grey'
	$input_cancel.refresh_label()
	
	set_icons()
	
#	self.rect_scale = Vector2(.6, .6)

func set_icons():
	input.icon_color = 'light'
	$input_accept.input_icon = input.input_accept
	$input_accept.refresh_icon()
	$input_cancel.input_icon = input.input_cancel
	$input_cancel.refresh_icon()

func _input(event):
	set_icons()