extends Control

onready var menu = get_node('./hud/menu')
var data = functions.get_json('res://data/menu.json')
var entry = 'menu'

func _ready():
	setup_menu()
	
func setup_menu():
	menu.data = data[entry]
	menu.init()

func _on_menu_select(selection):
	match selection:
		'start':
			get_tree().change_scene('res://rooms/start.tscn')
		'quit':
			get_tree().quit()
		'confirm':
			entry = 'confirm'
			setup_menu()
		'return':
			entry = 'menu'
			setup_menu()
		_:
			print(selection)

