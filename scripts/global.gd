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

# icons
var button = {
	a = preload('res://sprites/interface/buttons/a_button.png'),
	b = preload('res://sprites/interface/buttons/b_button.png'),
	x = preload('res://sprites/interface/buttons/x_button.png'),
	y = preload('res://sprites/interface/buttons/y_button.png'),
	triangle = preload('res://sprites/interface/buttons/triangle_button.png'),
	square = preload('res://sprites/interface/buttons/square_button.png'),
	circle = preload('res://sprites/interface/buttons/circle_button.png'),
	select = preload('res://sprites/interface/buttons/select_button.png'),
	start = preload('res://sprites/interface/buttons/start_button.png'),
	default = preload('res://sprites/interface/buttons/button.png')
}

var key = {
	arrow = preload('res://sprites/interface/buttons/arrow_key.png'),
	enter = preload('res://sprites/interface/buttons/enter_key.png'),
	delete = preload('res://sprites/interface/buttons/delete_key.png'),
	escape = preload('res://sprites/interface/buttons/esc_key.png'),
	spacebar = preload('res://sprites/interface/buttons/spacebar.png'),
	bar = preload('res://sprites/interface/buttons/bar_key.png'),
	default = preload('res://sprites/interface/buttons/key.png')
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