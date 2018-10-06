extends Node2D

onready var dialog = get_node('../hud/dialog')
var character_file = 'character.json'
var character_image = 'cat.png'
var dialog_entry = 'hello'
var sprite = load('res://sprites/characters/' + character_image)
var data = global.get_json('res://data/' + character_file)
var character_name = data.name
var image_size
var interactions = 0

func set_character_image():
	$character_sprite.set_texture(sprite)
	image_size = $character_sprite.texture.get_size()
	image_size.x = image_size.x / 2
	image_size.y = image_size.y / 2
	$character_body/character_shape.shape.set_extents(image_size)
	$dialog_zone/area.shape.set_radius(4 * image_size.y)

func _on_dialog_zone_area_entered(area):
	global.entered_dialog_zone = true
	$alert_bubble.visible = true
	dialog.data = data
	dialog.dialog_entry = dialog_entry
	dialog.next_page = dialog_entry

func _on_dialog_zone_area_exited(area):
	global.entered_dialog_zone = false
	$alert_bubble.visible = false
	
func _on_dialog_next_entry():
	dialog_entry = dialog.dialog_entry
	interactions += 1
	
func _ready():
	set_character_image()
	dialog.connect('next_entry', self, '_on_dialog_next_entry')
