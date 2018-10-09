extends Control

onready var player = get_node('/root/stage/player')
onready var dialog_options = find_node('dialog_options')
onready var dialog_title = find_node('dialog_title')
var get_menu_item = load('res://interface/menu_item.tscn')
var data = global.get_json('res://data/dialog.json')
var dialog_open = 0
var dialog_entry = 'start'
var current_page = ''
var next_page = dialog_entry
var dialog_text = []
var dialog_choice = []
var typing_effect = false
var indicator_on = true
var clicks = 0

signal next_entry
	
func _input(event):
	if Input.is_action_just_pressed('ui_accept') and global.entered_dialog_zone:
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
			
			if passage.has('call'):
				dialog_entry = passage.call
				emit_signal('next_entry')
				
			if passage.has('choices'):
				dialog_title.set_text(global.player_name)
				for choice in passage.choices:
					dialog_text.append(choice.dialog)
					dialog_choice.append(choice.link)
					typing_effect = false
					indicator_on = true
				
			else:
				dialog_title.set_text(data.name)
				dialog_text.append(passage.dialog)
				dialog_choice.append(passage.link)
				typing_effect = true
				indicator_on = false
				
			for i in range(0, dialog_text.size()):
				var menu_item = get_menu_item.instance()
				dialog_options.add_child(menu_item)
				var label = menu_item.get_node('label')
				label.set_text(dialog_text[i])
				label.set('custom_colors/font_color', global.color.grey)
				menu_item.call = dialog_choice[i]
				menu_item.connect('menu_selection', self, '_on_menu_select', [menu_item.call])
				
				if typing_effect == true:
					label.set_visible_characters(0)
					$dialog_box/typing_effect.start()
					
			dialog_options.get_child(0).grab_focus()
			dialog_options.get_child(0).get_node('label').set('custom_colors/font_color', global.color.white)
			
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