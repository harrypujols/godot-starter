extends StaticBody2D

onready var dialog = get_node('../hud/dialog')
export var character_name = 'Evil Me'
export var file_name = 'character'
export var dialog_entry = 'hello'
var data = functions.get_json('res://data/'+ character_name +'.json')


func _on_dialog_zone_area_entered(area):
	global.entered_dialog_zone = true
	$alert_bubble.visible = true
	dialog.data = data
	dialog.page = dialog_entry
	dialog.next_page = dialog_entry

func _on_dialog_zone_area_exited(area):
	global.entered_dialog_zone = false
	$alert_bubble.visible = false
