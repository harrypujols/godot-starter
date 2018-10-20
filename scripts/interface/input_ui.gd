extends Control

export(String) var input_text = 0
export var text_color = 'white'
export var icon_color = 'white'
export var icon_separation = 16
export(int) var font_size
export(int) var icon_size
onready var input_icon = find_node('icon')
onready var input_label = find_node('label')
onready var wrapper = find_node('wrapper')
onready var icon_name = find_node('input_icons')
var icon

func refresh_label():
	if input_text:
		input_label.visible = true
		input_label.set_text(input_text)
		input_label.set('custom_colors/font_color', global.color[text_color])
	else:
		input_label.visible = false
	
	if font_size:
		input_label.get_font('font').size = font_size
	
func refresh_icon(icon):
	input_icon.set('custom_colors/font_color', global.color[icon_color])
	
	if icon:
		input_icon.set_text(icon)
	if icon_size:
		input_icon.get_font('font').size = icon_size
		
func set_separation(separation):
	wrapper.set('custom_constants/separation', separation)
	
func _ready():
	set_separation(icon_separation)
	refresh_icon(icon)
	refresh_label()

func _on_joy_connection_changed():
	set_controller_icons()