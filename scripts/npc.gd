extends StaticBody2D

onready var dialog = get_node('../hud/dialog')
export var character_name = 'character'
var data = functions.get_json('res://data/'+ character_name +'.json')
var next_page = 'hello'

func _ready():
	pass

func _on_dialog_zone_area_entered(area):
	global.entered_dialog_zone = true
	$alert_bubble.visible = true
	dialog.data = data
	dialog.next_page = next_page

func _on_dialog_zone_area_exited(area):
	global.entered_dialog_zone = false
	$alert_bubble.visible = false
