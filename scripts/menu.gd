extends VBoxContainer

func get_data(url):
	var file = File.new()
	file.open(url, file.READ)
	var text = file.get_as_text()
	file.close()
	var result_json = JSON.parse(text)
	if result_json.error == OK:
		var result = result_json.result
		return(result)
	else:
    	print("Error: ", result_json.error)
    	print("Error Line: ", result_json.error_line)
    	print("Error String: ", result_json.error_string)

func _ready():
	var url = "res://data/menu.json"
	var data = get_data(url)
	print(data["menu"][0]["title"])
	
	for item in data["menu"]:
		var title = Label.new()
		var menu_item = load("res://interface/menu_item.tscn")
		var button = menu_item.instance()
		title.set_text(item["title"])
		self.add_child(button)
		button.add_child(title)
		
	self.get_child(0).grab_focus()
