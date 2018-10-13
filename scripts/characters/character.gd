extends KinematicBody2D

onready var dialog =  find_node('dialog')
export var character_file = 'character.json'
export var dialog_entry = 'hello'
export(Texture) var sprite
var image_size
var image_position
var data = global.get_json('res://data/' + character_file)
var character_name = data.name
var interactions = 0
signal interacted

func set_character_shape():
	$character_sprite.set_texture(sprite)
	image_position = $character_sprite.position
	image_size = $character_sprite.texture.get_size()
	image_size.x = image_size.x / 2
	image_size.y = image_size.y / 2
	$character_body/character_shape.shape.set_extents(image_size)
	$dialog_zone/area.shape.set_radius(4 * image_size.y)
	$alert_bubble.position.x = image_position.x
	$alert_bubble.position.y = image_position.y - image_size.y - 32

func _on_dialog_zone_area_entered(area):
	$character_dialog.entered_dialog_zone = true
	$alert_bubble.visible = true
	dialog.data = data
	dialog.dialog_entry = dialog_entry
	dialog.next_page = dialog_entry

func _on_dialog_zone_area_exited(area):
	$character_dialog.entered_dialog_zone = false
	$alert_bubble.visible = false
	
func _on_dialog_next_entry():
	dialog_entry = dialog.dialog_entry
	interactions += 1
	emit_signal('interacted')
	
func _ready():
	set_character_shape()
	dialog.dialog_entry = dialog_entry
	dialog.connect('next_entry', self, '_on_dialog_next_entry')
