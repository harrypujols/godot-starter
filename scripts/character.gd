extends StaticBody2D

onready var dialog = get_node('../hud/dialog')
export var character_file = 'character.json'
export var character_image = 'cat.png'
export var dialog_entry = 'hello'
var sprite = load('res://sprites/characters/' + character_image)
var data = global.get_json('res://data/'+ character_file)
var character_name = data.name
var image_size


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
	$character_sprite.set_texture(sprite)
	image_size = $character_sprite.texture.get_size()
	$character_shape.shape.set_extents(image_size)
	$dialog_zone/area.shape.set_radius(2 * image_size.y)
	print(image_size)
