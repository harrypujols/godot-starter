extends Node2D

onready var dialog = get_node('../../hud/dialog')
onready var items = self.get_parent()
export var item_name = 'item'
export var item_image = 'interface/buttons/button.png'
export var text_line = '...'

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

func set_item_image():
	$item_sprite.set_texture(sprite)
	image_size = $item_sprite.texture.get_size()
	image_size.x = image_size.x / 2
	image_size.y = image_size.y / 2
	$item_area/item_shape.shape.set_extents(image_size)

func set_item_dialog():
	dialog_open = 1
	dialog.data = dialog_data
	dialog.dialog_entry = dialog_entry
	dialog.next_page = dialog_entry
	dialog.clicks += 1
	dialog.dialog_open = 1
	dialog.init()

func init():
	set_item_dialog()
	
func _ready():
	if text_line != '...':
		dialog_data.passages[0].dialog = text_line
		
	set_item_image()

func _on_item_area_area_shape_entered(area_id, area, area_shape, self_shape):
	global.entered_dialog_zone = true
	init()

func _input(event):
	if Input.is_action_just_pressed('ui_accept') and dialog_open == 1:
		dialog_open = 0
		items.count += 1
		emit_signal('collected')
		dialog.reset_dialog()
		self.queue_free()

func _on_item_tree_exited():
	global.entered_dialog_zone = false
