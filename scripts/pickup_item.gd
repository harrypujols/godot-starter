extends Node2D

onready var dialog = get_node('../../hud/dialog')
onready var items = self.get_parent()
export var item_name = 'item'
export var item_image = 'interface/buttons/button.png'
export var text_line = '...'
export var collectible = true
export var solid = true

signal collected

var sprite = load('res://sprites/' + item_image)
var image_size

var dialog_open = 0
var dialog_entry = 'dialog'
var dialog_text = 'I found one ' + item_name + '!'
var dialog_data = {
  'name': 'player',
  'passages': [
    {
      'name': 'dialog',
      'dialog': dialog_text,
      'link': 'end'
    }

   ]
}

func set_item_shape():
	$item_sprite.set_texture(sprite)
	image_size = $item_sprite.texture.get_size()
	image_size.x = image_size.x / 2
	image_size.y = image_size.y / 2
	$item_area/item_shape.shape.set_extents(image_size)
	
	if solid:
		add_item_body()

func add_item_body():
	var body = StaticBody2D.new()
	var shape = RectangleShape2D.new()
	shape.set_extents(image_size)
	var collision = CollisionShape2D.new()
	collision.set_shape(shape)
	self.add_child(body)
	body.name = 'item_body'
	body.add_child(collision)
	solid = true
		
func remove_item_body():
	if self.has_node('item_body'):
		$item_body.queue_free
		solid = false

func set_item_dialog():
	dialog_open = 1
	dialog.data = dialog_data
	dialog.dialog_entry = dialog_entry
	dialog.next_page = dialog_entry
	dialog.clicks += 1
	dialog.dialog_open = 1
	dialog.init()

func collect_item():
	items.count += 1
	emit_signal('collected')
	self.queue_free()

func init():
	set_item_dialog()
	
func _ready():
	if text_line != '...':
		dialog_data.passages[0].dialog = text_line
		
	set_item_shape()

func _on_item_area_area_shape_entered(area_id, area, area_shape, self_shape):
	global.entered_dialog_zone = true
	init()

func _input(event):
	if Input.is_action_just_pressed('ui_accept') and dialog_open == 1:
		if collectible:
			collect_item()
		dialog_open = 0
		dialog.reset_dialog()
		

func _on_item_tree_exited():
	global.entered_dialog_zone = false

func _on_item_area_area_shape_exited(area_id, area, area_shape, self_shape):
	dialog_open = 0
	global.entered_dialog_zone = false
