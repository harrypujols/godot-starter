extends Node2D

onready var dialog = get_node('../../hud/dialog')
export var item_name = 'item'
export var item_image = 'interface/buttons/button.png'
var sprite = load('res://sprites/' + item_image)
var image_size

func set_item_image():
	$item_sprite.set_texture(sprite)
	image_size = $item_sprite.texture.get_size()
	image_size.x = image_size.x / 2
	image_size.y = image_size.y / 2
	$item_area/item_shape.shape.set_extents(image_size)
	
func _ready():
	set_item_image()

func _on_item_area_area_shape_entered(area_id, area, area_shape, self_shape):
	pass # replace with function body
