extends Control

onready var menu = get_node('./hud/menu')
onready var title = get_node('./hud/menu/title')
var data = functions.get_json('res://data/pause.json')
var entry = 'menu'

func _ready():
	title.visible = true
	title.set_text(data.titles[0])
	setup_menu()
	
func setup_menu():
	menu.data = data[entry]
	menu.init()
	for menu_item in menu.get_node('./items').get_children():
		menu_item.set('pause/mode', 'process')
	menu.get_node('./items').get_child(0).grab_focus()

func _on_menu_select(selection):
	match selection:
		'unpause':
			get_tree().paused = false
			self.visible = false
			global.pause = false
		'reset':
			get_tree().change_scene('res://rooms/intro.tscn')
		'confirm':
			entry = 'confirm'
			title.set_text(data.titles[1])
			setup_menu()
		'return':
			entry = 'menu'
			title.set_text(data.titles[0])
			setup_menu()
		_:
			print(selection)

func _input(event):
	if Input.is_action_pressed('ui_pause'):
		match global.pause:
			true:
				get_tree().paused = false
				self.visible = false
				global.pause = false
			false:
				get_tree().paused = true
				self.visible = true
				global.pause = true