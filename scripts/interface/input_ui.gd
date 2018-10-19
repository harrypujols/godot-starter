extends HBoxContainer

export(String) var input_text
export var text_color = 'white'
export(String) var icon_color = 'white'
export var icon_separation = 16
export(int) var font_size
export(int) var icon_size
var icon



func refresh_label():
	$input_label.visible = true
	$input_label.set_text(input_text)
	$input_label.set('custom_colors/font_color', global.color[text_color])
	
	if font_size:
		$input_label.set('custom_fonts/settings/size', font_size)
	
func refresh_icon():
	$input_icon.set('custom_colors/font_color', global.color[icon_color])
	
	if icon:
		$input_icon.set_text(icon)
	if icon_size:
		$input_icon.set('custom_fonts/settings/size', icon_size)
	
func _ready():
	self.set('custom_constants/separation', icon_separation)
	
	refresh_icon()
	
	if input_text:
		refresh_label()
	else:
		$input_label.visible = false
