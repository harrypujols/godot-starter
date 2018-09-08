extends Label

var character_name = 'npc'
var data = functions.get_json('res://data/npc.json')
var page = 'hello'
var current_page = page
var next_page = page
var dialog_text = '...'

func reset():
	for passage in data.passages:
		if current_page == passage.name:
			dialog_text = passage.dialog
			next_page = passage.link
			
	self.set_text(dialog_text)
	self.set_visible_characters(0)
	
	if next_page == 'end':
		current_page = page
	else:
		current_page = next_page

func _on_typing_effect_timeout():
	self.set_visible_characters(get_visible_characters() + 1)
