extends Node2D

onready var dialog = get_node('../../hud/dialog')
onready var items = self.get_parent()
export var item_name = 'item'
export var item_image = 'interface/buttons/button.png'
signal collected
var sprite = load('res://sprites/' + item_image)
var image_size
var dialog_entry = 'dialog'
var dialog_data = {
  'name': 'player',
  'passages': [
    {
      'name': 'dialog',
      'dialog': 'You found one ' + item_name + '!',
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
	global.entered_dialog_zone = true
	dialog.data = dialog_data
	dialog.dialog_entry = dialog_entry
	dialog.next_page = dialog_entry
	dialog.clicks += 1
	
func _ready():
	set_item_image()

func _on_item_area_area_shape_entered(area_id, area, area_shape, self_shape):
	items.count += 1
	set_item_dialog()
	dialog.init()
	emit_signal('collected')
	self.queue_free()

func _input(event):
	if Input.is_action_just_pressed('ui_accept') and global.entered_dialog_zone:
		if dialog.dialog_open == 1:
			reset_dialog()
