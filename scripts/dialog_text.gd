extends Label

var dialog_text = ['Hello, welcome to the dialog!']
var page = 0


func _ready(): 
	self.set_text(dialog_text[page])
	self.set_visible_characters(0)

func _on_typing_effect_timeout():
	self.set_visible_characters(get_visible_characters() + 1)
