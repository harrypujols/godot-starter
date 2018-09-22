extends Control

onready var menu = get_node('./hud/menu')
onready var title = get_node('./hud/menu/title')
var data = functions.get_json('res://data/menu.json')
var entry = 'menu'

func _ready():
	title.set_text(data.title.confirm)
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
			title.visible = true
			setup_menu()
		'return':
			entry = 'menu'
			title.visible = false
			setup_menu()
		_:
			print(selection)

