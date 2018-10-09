extends KinematicBody2D

onready var dialog =  get_tree().get_nodes_in_group('dialog')[0]
var character_file = 'character.json'
var character_image = 'cat.png'
var image_size
var image_position
var dialog_entry = 'hello'
var sprite = load('res://sprites/characters/' + character_image)
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
	$character_body.shape.set_extents(image_size)
	$dialog_zone/area.shape.set_radius(4 * image_size.y)
	$alert_bubble.position.x = image_position.x
	$alert_bubble.position.y = image_position.y - image_size.y - 32

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
	emit_signal('interacted')
	
func _ready():
	print(get_tree().current_scene.name)
	set_character_shape()
	dialog.connect('next_entry', self, '_on_dialog_next_entry')
