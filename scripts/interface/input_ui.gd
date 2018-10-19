extends HBoxContainer

export(String) var input_text
export var text_color = 'white'
var font_size
var input_icon_separation = 16
var input_icon
var icon_color
var icon_size

func refresh_label():
	$input_label.visible = true
	$input_label.set_text(input_text)
	$input_label.set('custom_colors/font_color', global.color[text_color])
	if font_size:
		$input_label.set('custom_fonts/settings/size', font_size)
	
func refresh_icon():
	$input_icon.set_text(input_icon)
	if icon_color:
		$input_icon.set('custom_colors/font_color', global.color[icon_color])
	if icon_size:
		$input_icon.set('custom_fonts/settings/size', icon_size)
	
func _ready():
	self.set('custom_constants/separation', input_icon_separation)
	
	if input_icon:
		refresh_icon()
	
	if input_text:
		refresh_label()
	else:
		$input_label.visible = false
