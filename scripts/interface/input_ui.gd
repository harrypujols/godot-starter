extends HBoxContainer

export(String) var input_text
export var text_color = 'white'
export(String) var icon_color = 'white'
export var icon_separation = 16
export(int) var font_size
export(int) var icon_size
var icon



func refresh_label():
	if input_text:
		$input_label.visible = true
		$input_label.set_text(input_text)
		$input_label.set('custom_colors/font_color', global.color[text_color])
	else:
		$input_label.visible = false
	
	if font_size:
		$input_label.get_font('font').size = font_size
	
func refresh_icon():
	$input_icon.set('custom_colors/font_color', global.color[icon_color])
	
	if icon:
		$input_icon.set_text(icon)
	if icon_size:
		$input_icon.get_font('font').size = icon_size
	
func _ready():
	self.set('custom_constants/separation', icon_separation)
	refresh_icon()
	refresh_label()
