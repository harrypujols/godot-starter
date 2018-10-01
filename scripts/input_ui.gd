extends HBoxContainer

export var input_icon_name = 'default'
export var input_icon_type = 'button'
export var icon_color = 'white'
export var input_text = 'unassigned'
export var text_color = 'white'
var input_icon
var input_text_color
var input_icon_separation = 16
var input_label = Label.new()

func refresh_label():
	for child in self.get_children():
		if child is Label:
			child.queue_free()
			self.remove_child(child)
	
	input_text_color = global.color[text_color]
	input_label.set_text(input_text)
	input_label.name = 'input_label'
	input_label.set('custom_colors/font_color', input_text_color)
	self.add_child(input_label)
	
func refresh_icon():
	if icon_color == 'white':
		input_icon = global[input_icon_type]['inverse'][input_icon_name]
	else:
		input_icon = global[input_icon_type][input_icon_name]
		
	$input_icon.set_texture(input_icon)
	
func _ready():
	self.set('custom_constants/separation', input_icon_separation)
	refresh_icon()
	
	if input_text != 'unassigned':
		refresh_label()
