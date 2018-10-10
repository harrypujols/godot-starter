extends Node2D

onready var dialog = get_tree().get_nodes_in_group('dialog')[0]
export var item_name = 'item'
export var text_line = '...'
export var item_image = 'interface/coin.png'
export var collectible = true
export var solid = true

signal collected

var sprite
var dialog_open = 0
var dialog_entry = 'dialog'
onready var dialog_text = 'I found one ' + item_name + '!'
onready var dialog_data = {
  'name': global.player_name,
  'passages': [
    {
      'name': 'dialog',
      'dialog': dialog_text,
      'link': 'end'
    }

   ]
}

func init():
	sprite = load('res://sprites/' + item_image)
	$item_sprite.set_texture(sprite)
	var image_size = $item_sprite.texture.get_size()
	var item_shape = RectangleShape2D.new()
	var item_collision = CollisionShape2D.new()
	image_size.x = image_size.x / 2
	image_size.y = image_size.y / 2
	item_shape.set_extents(image_size)
	item_collision.set_shape(item_shape)
	
	$item_area.add_child(item_collision)
	
	if solid:
		add_item_body(image_size)

func add_item_body(image_size):
	var body = StaticBody2D.new()
	var shape = RectangleShape2D.new()
	var collision = CollisionShape2D.new()
	shape.set_extents(image_size)
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
	self.queue_free()
	emit_signal('collected')

func set_text(dialog_text):
	if text_line != '...':
		dialog_data.passages[0].dialog = text_line
	else:
		dialog_data.passages[0].dialog = dialog_text
		
func _ready():
	set_text(dialog_text)
	init()

func _on_item_area_area_shape_entered(area_id, area, area_shape, self_shape):
	global.entered_dialog_zone = true
	set_item_dialog()

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
