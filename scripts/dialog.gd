extends Control

onready var player = get_node('../../player')
onready var dialog_options = get_node('dialog_box/dialog_options')
var get_menu_item = load('res://interface/menu_item.tscn')
var data = functions.get_json('res://data/dialog.json')
var dialog_open = 0
var dialog_entry = 'start'
var current_page = ''
var next_page = dialog_entry
var dialog_text = []
var dialog_choice = []
var typing_effect = false
var indicator_on = true
var clicks = 0
var text_color = global.color.white
	
func _input(event):
	if Input.is_action_just_pressed('ui_accept') && global.entered_dialog_zone:
		clicks += 1
		if dialog_open == 0:
			init()
			
	if Input.is_action_just_pressed('ui_cancel'):
		reset_dialog()
		
func init():
	$dialog_box.popup_centered()
	player.state = 'interact'
	dialog_open = 1
	set_dialog()
	
func reset_dialog():
	$dialog_box.hide()
	player.state = 'move'
	dialog_open = 0
	clicks = 0
	next_page = dialog_entry
	
func set_dialog():
	if next_page == 'end':
		reset_dialog()
		pass
	
	dialog_text.clear()
	dialog_choice.clear()
	current_page = next_page
	
	if typing_effect == true:
		dialog_options.margin_left = 20
		$dialog_box/typing_effect.stop()
		typing_effect = false
	
	if dialog_options.get_children().size() > 0:
		for child in dialog_options.get_children():
			child.queue_free()
			dialog_options.remove_child(child)
	
	for passage in data.passages:
		if current_page == passage.name:
			if passage.has('choices'):
				
				for choice in passage.choices:
					dialog_text.append(choice.dialog)
					dialog_choice.append(choice.link)
					typing_effect = false
					indicator_on = true
					text_color = global.color.green
				
			else:
				dialog_text.append(passage.dialog)
				dialog_choice.append(passage.link)
				typing_effect = true
				indicator_on = false
				text_color = global.color.white
				
				
			for i in range(0, dialog_text.size()):
				var menu_item = get_menu_item.instance()
				dialog_options.add_child(menu_item)
				var label = menu_item.get_node('label')
				label.set_text(dialog_text[i])
				label.set('custom_colors/font_color', text_color)
				menu_item.call = dialog_choice[i]
				menu_item.connect('menu_selection', self, '_on_menu_select', [menu_item.call])
				
				if typing_effect == true:
					label.set_visible_characters(0)
					$dialog_box/typing_effect.start()
					
			dialog_options.get_child(0).grab_focus()
			
			if indicator_on == false:
				indicator_off()
	
func indicator_off():
	var indicator = dialog_options.get_child(0).get_node('indicator')
	dialog_options.margin_left = 0
	indicator.visible = false
	
func _on_typing_effect_timeout():
	var label =  dialog_options.get_child(0).get_node('label')
	label.set_visible_characters(label.get_visible_characters() + 1)

func _on_menu_select(selection):
	next_page = selection
	if clicks > 1:
		set_dialog()
