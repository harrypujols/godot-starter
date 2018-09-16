extends Control

onready var menu = get_node('./hud/menu')
var data = functions.get_json('res://data/menu.json')

func _ready():
	menu.data = data.menu
	menu.init()

func _on_menu_select(selection):
	match selection:
		'start':
			get_tree().change_scene('res://rooms/start.tscn')
		'quit':
			get_tree().quit()
		_:
			print(selection)

