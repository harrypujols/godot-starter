extends StaticBody2D

onready var dialog = get_node('../hud/dialog')
export var file_name = 'character'
export var dialog_entry = 'hello'
var data = global.get_json('res://data/'+ file_name +'.json')
var character_name = data.name


func _on_dialog_zone_area_entered(area):
	global.entered_dialog_zone = true
	$alert_bubble.visible = true
	dialog.data = data
	dialog.dialog_entry = dialog_entry
	dialog.next_page = dialog_entry

func _on_dialog_zone_area_exited(area):
	global.entered_dialog_zone = false
	$alert_bubble.visible = false
	
func _ready():
	var image_size = $character_sprite.texture.get_size()
	$character_shape.shape.set_extents(image_size)
	$dialog_zone/area.shape.set_radius(4 * image_size.y)
