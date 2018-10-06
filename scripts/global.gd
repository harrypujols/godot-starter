extends Node

var entered_dialog_zone = false
var pause = false

var color = {
	'white': Color('#ffffff'),
	'grey': Color('#aaaaaa'),
	'black': Color('#000000'),
	'light-green': Color('#9bbc0f'),
	'green': Color('#8bac0f'),
	'dark-green': Color('#306230'),
	'pitch-dark-green': Color('#0f380f')
}

# load json file
static func get_json(path):
	var file = File.new()
	file.open(path, file.READ)
	var text = file.get_as_text()
	file.close()
	var result_json = JSON.parse(text)
	if result_json.error == OK:
		var result = result_json.result
		return(result)
	else:
    	print('Error: ', result_json.error)
    	print('Error Line: ', result_json.error_line)
    	print('Error String: ', result_json.error_string)