extends VBoxContainer

var menu = ["Start", "Quit"]

func _ready():
	
	for item in menu:
		var title = Label.new()
		var menu_item = load("res://interface/menu_item.tscn")
		var button = menu_item.instance()
		title.set_text(item)
		self.add_child(button)
		button.add_child(title)
		
	self.get_child(1).grab_focus()
