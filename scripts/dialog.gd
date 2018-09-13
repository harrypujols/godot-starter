extends Control

onready var player = get_node('../../player')
onready var dialog_options = get_node('dialog_box/dialog_choices')
var get_menu_item = load('res://interface/menu_item.tscn')
var data = functions.get_json('res://data/red.json')
var dialog_open = 0
var page = 'hello'
var current_page = ''
var next_page = page
var dialog_text = []
var dialog_choice = []
var typing_effect = false
var indicator_on = true
var clicks = 0
	
func _input(event):
	if Input.is_action_pressed('ui_accept') && global.entered_dialog_zone:
		clicks += 1
		if dialog_open == 0:
			$dialog_box.popup_centered()
			player.state = 'interact'
			dialog_open = 1
			set_dialog()

func set_dialog():
	if next_page == 'end':
		$dialog_box.hide()
		player.state = 'move'
		dialog_open = 0
		clicks = 0
		current_page = page
		next_page = page
		pass
		
	dialog_text.clear()
	dialog_choice.clear()
	current_page = next_page
	
	if typing_effect == true:
		$dialog_box/typing_effect.stop()
		typing_effect = false
	
	if dialog_options.get_children().size() > 0:
		for child in dialog_options.get_children():
			dialog_options.remove_child(child)
	
	for passage in data.passages:
		if current_page == passage.name:
			if passage.has('choices'):
				
				for choice in passage.choices:
					dialog_text.append(choice.dialog)
					dialog_choice.append(choice.link)
					typing_effect = false
					indicator_on = true
				
			else:
				dialog_text.append(passage.dialog)
				dialog_choice.append(passage.link)
				typing_effect = true
				indicator_on = false
				
				
			for i in range(0, dialog_text.size()):
				var menu_item = get_menu_item.instance()
				dialog_options.add_child(menu_item)
				var title = menu_item.get_node('title')
				title.set_text(dialog_text[i])
				menu_item.call = dialog_choice[i]
#				how do I change the margin?
				menu_item.connect('menu_selection', self, '_on_menu_select', [menu_item.call])
				
				if typing_effect == true:
					title.set_visible_characters(0)
					$dialog_box/typing_effect.start()
					
			dialog_options.get_child(0).grab_focus()
			
			if indicator_on == false:
				var indicator = dialog_options.get_child(0).get_node('indicator')
				indicator.visible = false
	
func _on_typing_effect_timeout():
	var title =  dialog_options.get_child(0).get_node('title')
	title.set_visible_characters(title.get_visible_characters() + 1)

func _on_menu_select(selection):
	next_page = selection
	if clicks > 1:
		set_dialog()
