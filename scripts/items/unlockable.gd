extends Node

onready var item = get_parent()
onready var item_sprite = item.get_node('item_sprite')
onready var item_area = item.get_node('item_area')
var shape = CircleShape2D.new()
var collision = CollisionShape2D.new()

func _ready():
	item.dialog_active = false
	set_unlockable_area()

func _input(event):
	if Input.is_action_pressed('ui_accept') and item.entered_dialog_zone and event.echo:
		print('the key is pressed down')
			
func set_unlockable_area():
	var image_size = item_sprite.texture.get_size()
	shape.set_radius(2 * image_size.y)
	
	for child in item_area.get_children():
		child.queue_free()
		
	collision.set_shape(shape)
	item_area.add_child(collision)