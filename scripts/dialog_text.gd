extends Label

var content = ['Hello, welcome to the dialog!', 'I am evil you.']
var page = 0

func reset():
	self.set_text(content[page])
	self.set_visible_characters(0)

func _ready(): 
	reset()

func _on_typing_effect_timeout():
	self.set_visible_characters(get_visible_characters() + 1)
