extends StaticBody2D

onready var dialog_box = get_node('../hud/dialog')
onready var dialog_text = dialog_box.get_node('dialog_text')
export var character_name = 'red'
var dialog = functions.get_json('res://data/'+ character_name +'.json')

func _ready():
	pass

func _on_dialog_zone_area_entered(area):
	global.entered_dialog_zone = true
#	dialog_text.dialog = dialog
	$alert_bubble.visible = true

func _on_dialog_zone_area_exited(area):
	global.entered_dialog_zone = false
	$alert_bubble.visible = false
