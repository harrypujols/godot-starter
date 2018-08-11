extends VBoxContainer

func get_json_file(url):
	var file = File.new()
	file.open(url, file.READ)
	var text = file.get_as_text()
	file.close()
	var result = {}
	var result_json = JSON.parse(text)
	if result_json.error == OK:
		var data = result_json.result
		print(data)
	else:
    	print("Error: ", result_json.error)
    	print("Error Line: ", result_json.error_line)
    	print("Error String: ", result_json.error_string)
	
var menu = ["Start", "Quit"]

func _ready():
	var url = "res://data/menu.json"
	get_json_file(url)
	
	for item in menu:
		var title = Label.new()
		var menu_item = load("res://interface/menu_item.tscn")
		var button = menu_item.instance()
		title.set_text(item)
		self.add_child(button)
		button.add_child(title)
		
	self.get_child(0).grab_focus()
