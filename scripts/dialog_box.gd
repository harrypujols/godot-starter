extends PopupDialog

var character_name = 'npc'
var data = functions.get_json('res://data/dialog.json')
var page = 'start'
var current_page = page
var next_page = page
var dialog_text = '...'

func init():
	print('current_page' + current_page)
	print('next_page' + next_page)
	if next_page == 'end':
		self.hide()
	else:
		current_page = next_page
		
		for passage in data.passages:
			if passage.name == current_page:
				$dialog_text.dialog = passage.dialog
				$dialog_text.init()
				$typing_effect.start()


