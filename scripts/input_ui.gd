extends HBoxContainer

var input_icon = global.button.inverse.default
var input_icon_separation = 16
var input_label = Label.new()
var input_text = 'unassigned'
var input_text_color = global.color.white

func _ready():
	self.set('custom_constants/separation', input_icon_separation)
	$input_icon.set_texture(input_icon)
	input_text = 'foo'
	
	if input_text != 'unassigned':
		input_label.set_text(input_text)
		input_label.name = 'input_label'
		input_label.set('custom_colors/font_color', input_text_color)
		self.add_child(input_label)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
