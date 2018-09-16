extends VBoxContainer

onready var parent = get_node('../../')
var data = {}
var get_menu_item = load('res://interface/menu_item.tscn')

func init():
	if self.get_children().size() > 0:
		for child in self.get_children():
			child.queue_free()
			self.remove_child(child)
			
	for item in data:
		var menu_item = get_menu_item.instance()
		self.add_child(menu_item)
		var title = menu_item.get_node('title')
		title.set_text(item.title)
		menu_item.call = item.call
		menu_item.connect('menu_selection', parent, '_on_menu_select', [menu_item.call])
		
	self.get_child(0).grab_focus()
