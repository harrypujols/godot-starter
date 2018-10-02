extends Control

onready var menu = get_node('./hud/menu')
onready var title = get_node('./hud/menu/title')
onready var dialog = get_node('../dialog')
var data = global.get_json('res://data/pause.json')
var entry = 'pause'

func _ready():
	self.visible = false
	
func setup_menu():
	menu.data = data[entry]
	menu.init()
	
func _on_menu_select(selection):
	match selection:
		'unpause':
			get_tree().paused = false
			self.visible = false
			global.pause = false
		'reset':
			get_tree().paused = false
			global.pause = false
			get_tree().change_scene('res://rooms/intro.tscn')
		'confirm':
			entry = 'reload'
			title.set_text(data.title.confirm)
			setup_menu()
		'return':
			entry = 'pause'
			title.set_text(data.title.pause)
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
				if dialog.dialog_open == 1:
					dialog.dialog_options.get_child(0).grab_focus()
					if dialog.indicator_on == false:
						dialog.indicator_off()
			false:
				get_tree().paused = true
				self.visible = true
				global.pause = true
				title.visible = true
				title.set_text(data.title.pause)
				entry = 'pause'
				setup_menu()