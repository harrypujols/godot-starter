extends VBoxContainer

onready var dialog_box = get_node('../')
var get_menu_item = load('res://interface/menu_item.tscn')
var dialog = {}
var dialog_text = '...'

func init():
	for item in dialog:
		var menu_item = get_menu_item.instance()
		self.add_child(menu_item)
		var title = menu_item.get_node('title')
		title.set_text(item.title)
		menu_item.call = item.call
		menu_item.connect('menu_selection', self, '_on_menu_select', [menu_item.call])
	
	if self.get_children().size() == 1:
#		self.get_child(0).get_node('title').set_visible_characters(0)
		pass
	else:
		self.get_child(0).grab_focus()

func _on_menu_select(selection):
	dialog_box.next_page = selection
	dialog_box.init()

func _on_typing_effect_timeout():
	self.get_child(0).get_node('title').set_visible_characters(get_visible_characters() + 1)
