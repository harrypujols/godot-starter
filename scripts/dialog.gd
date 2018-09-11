extends Control

onready var player = get_node('../../../player')
var data = functions.get_json('res://data/npc.json')
onready var dialog_label = $dialog_box/dialog_text
var dialog_open = 0
var page = 'hello'
var current_page = page
var next_page = page
var dialog_text = '...'
	
func _input(event):
	if Input.is_action_pressed('ui_accept') && global.entered_dialog_zone:
		print('--clicked--')
		print('current_page ' + current_page)
		print('next_page ' + next_page)
		match dialog_open:
			1:
				$dialog_box.hide()
				player.state = 'move'
				dialog_open = 0	
			0:
				$dialog_box.popup_centered()
				player.state = 'interact'
				current_page = next_page
				set_dialog()

func set_dialog():
	for passage in data.passages:
		if current_page == passage.name:
			dialog_text = passage.dialog
			next_page = passage.link
			dialog_label.set_text(dialog_text)
			dialog_label.set_visible_characters(0)
			$dialog_box/typing_effect.start()
			if next_page == 'end':
				dialog_open = 1
				current_page = page
				next_page = page

func _on_typing_effect_timeout():
	dialog_label.set_visible_characters(dialog_label.get_visible_characters() + 1)
