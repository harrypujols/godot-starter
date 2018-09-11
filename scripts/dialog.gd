extends Control

onready var player = get_node('../../../player')
onready var dialog_label = get_node('dialog_box/dialog_text')
onready var dialog_options = get_node('dialog_box/dialog_choices')
var get_menu_item = load('res://interface/menu_item.tscn')
var data = functions.get_json('res://data/red.json')
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
			if passage.has('choices'):

				get_node('dialog_box/dialog_text').visible = false
				get_node('dialog_box/dialog_choices').visible = true

				if dialog_options.get_children().size() > 0:
					for child in dialog_options.get_children():
						dialog_options.remove_child(child)
#						child.queue_free()
				
				for choice in passage.choices:
					var menu_item = get_menu_item.instance()
					dialog_options.add_child(menu_item)
					var title = menu_item.get_node('title')
					title.set_text(choice.dialog)
					menu_item.call = choice.link
					menu_item.connect('item_focused', self, '_on_menu_select', [menu_item.call])
		
				dialog_options.get_child(0).grab_focus()
				print('dialog children ' + String(dialog_options.get_children().size()))
				next_page = 'end'
				
			else:
				get_node('dialog_box/dialog_text').visible = true
				get_node('dialog_box/dialog_choices').visible = false
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

func _on_menu_select(selection):
	print(selection)
