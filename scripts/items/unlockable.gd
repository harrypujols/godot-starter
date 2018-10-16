extends Control

onready var item = get_parent()
onready var item_sprite = item.get_node('item_sprite')
onready var item_area = item.get_node('item_area')
var unlockable_position = Vector2(0,0)
var shape = CircleShape2D.new()
var collision = CollisionShape2D.new()
var key_pressed = false
var accumulator = 0
var charge_time = 1

func _ready():
	item.dialog_active = false
	set_unlockable_area()

func _input(event):
	if Input.is_action_pressed('ui_accept') and item.entered_dialog_zone:
		key_pressed = true
	else:
		key_pressed = false
		$key_progress.value = 0
		accumulator = 0
		
func set_unlockable_area():
	var image_size = item_sprite.texture.get_size()
	shape.set_radius(2 * image_size.y)
	
	for child in item_area.get_children():
		child.queue_free()
		
	collision.set_shape(shape)
	item_area.add_child(collision)
	
func _process(delta):
	if key_pressed:
		$key_progress.value += 1
		if $key_progress.value == $key_progress.max_value:
			print('baddabing!')
			$key_progress.value = 0
		accumulator += delta
		if accumulator > charge_time: 
			print('ding dong')
			accumulator = 0
