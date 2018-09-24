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
	default = preload('res://sprites/interface/buttons/button.png')
}

var key = {
	arrow = preload('res://sprites/interface/buttons/arrow_key.png'),
	enter = preload('res://sprites/interface/buttons/enter_key.png'),
	delete = preload('res://sprites/interface/buttons/delete_key.png'),
	spacebar = preload('res://sprites/interface/buttons/spacebar.png'),
	default = preload('res://sprites/interface/buttons/key.png')
}