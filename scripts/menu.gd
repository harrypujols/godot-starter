extends VBoxContainer

var data = global.get_json('res://data/menu.json')
var get_menu_item = load('res://interface/menu_item.tscn')

func _ready():
	
	for item in data.menu:
		var menu_item = get_menu_item.instance()
		self.add_child(menu_item)
		var title = Label.new()
		title.set_text(item.title)
		menu_item.add_child(title)
		menu_item.call = item.call
		menu_item.connect('menu_selection', self, '_on_menu_select', [menu_item.call])
		
	self.get_child(0).grab_focus()


func _on_menu_select(selection):
	match selection:
		'start':
			get_tree().change_scene('res://rooms/start.tscn')
		'quit':
			get_tree().quit()
		_:
			print(selection)
