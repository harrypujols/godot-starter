extends HBoxContainer

export(String) var input_text
export var text_color = 'white'
var input_text_color
var input_icon_separation = 16
var input_label = Label.new()
var input_icon
var icon_color

func refresh_label():
	for child in self.get_children():
		if child is Label:
			child.queue_free()
			self.remove_child(child)
	
	input_label.set_text(input_text)
	input_label.name = 'input_label'
	input_label.set('custom_colors/font_color', global.color[text_color])
	self.add_child(input_label)
	
func refresh_icon():
	$input_icon.set_text(input_icon)
	if icon_color:
		$input_icon.set('custom_colors/font_color', global.color[icon_color])
	
func _ready():
	self.set('custom_constants/separation', input_icon_separation)
	
	if input_icon:
		refresh_icon()
	
	if input_text:
		refresh_label()
