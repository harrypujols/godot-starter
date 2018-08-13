extends VBoxContainer

var get_helpers = load("res://interface/helpers.tscn")
var helpers = get_helpers.instance()
export var data_file = "res://data/menu.json"

func _ready():
	var data = helpers.get_json(data_file)
	
	for item in data.menu:
		var title = Label.new()
		var get_menu_item = load("res://interface/menu_item.tscn")
		var menu_item = get_menu_item.instance()
		title.set_text(item.title)
		self.add_child(menu_item)
		menu_item.add_child(title)
		menu_item.call = item.call
		
	self.get_child(0).grab_focus() 
