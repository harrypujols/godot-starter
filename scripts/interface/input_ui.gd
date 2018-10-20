extends Control

export(String) var input_text = 0
export var text_color = 'white'
export var icon_color = 'white'
export var icon_separation = 16
export(int) var font_size
export(int) var icon_size
export(String, 'default', 'accept', 'cancel') var icon_name = 'default'
onready var icon = find_node('icon')
onready var label = find_node('label')
onready var wrapper = find_node('wrapper')
onready var input_icons = find_node('input_icons')

func refresh_label():
	if input_text:
		label.visible = true
		label.set_text(input_text)
		label.set('custom_colors/font_color', global.color[text_color])
	else:
		label.visible = false
	
	if font_size:
		label.get_font('font').size = font_size
	
func refresh_icon(icon_name):
	icon.set('custom_colors/font_color', global.color[icon_color])
	icon.set_text(input_icons[icon_name])
	
	if icon_size:
		icon.get_font('font').size = icon_size
		
func set_separation(separation):
	wrapper.set('custom_constants/separation', separation)
	
func _ready():
	input_icons.connect('icon_changed', self, '_on_icon_changed')
	set_separation(icon_separation)
	refresh_icon(icon_name)
	refresh_label()

func _on_icon_changed():
	refresh_icon(icon_name)