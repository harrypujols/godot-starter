extends Control

onready var item = get_parent()
onready var item_sprite = item.find_node('item_sprite')
onready var item_area = item.find_node('item_area')

var shape = CircleShape2D.new()
var collision = CollisionShape2D.new()

var key_pressed = false
var unlocked = false

var center = get_size() / 2
var radius = 40
var angle_from = 0
var angle_to = 0
var color = global.color.pitch_dark_green

signal press_completed

func _ready():
	item.dialog_active = false
	set_unlockable_area()
	set_prompt_position()

func _input(event):
	if Input.is_action_pressed('ui_accept') and item.entered_dialog_zone and unlocked == false:
		key_pressed = true
	else:
		key_pressed = false
		$key_progress.value = 0
		
func set_prompt_position():
	var image_size = item_sprite.texture.get_size()
	var image_position = item_sprite.position
	$prompt.position.x = image_position.x
	$prompt.position.y = image_position.y - image_size.y - 32
	$prompt.visible = false
	
func set_unlockable_area():
	var image_size = item_sprite.texture.get_size()
	shape.set_radius(2 * image_size.y)
	for child in item_area.get_children():
		child.queue_free()
	collision.set_shape(shape)
	item_area.add_child(collision)
	
func draw_circle_arc_fill(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PoolVector2Array()
	points_arc.push_back(center)
	var colors = PoolColorArray([color])
	for i in range(nb_points+1):
		var angle_point = deg2rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	draw_polygon(points_arc, colors)

func _draw():
	draw_circle_arc_fill(center, radius, angle_from, angle_to, color)
	
func _process(delta):
	if key_pressed:
		$key_progress.value += delta * $key_progress.max_value * $key_progress.step
		if $key_progress.value >= $key_progress.max_value:
			emit_signal('press_completed')
			item.set_item_dialog()
			unlocked = true
			$key_progress.value = 0
	angle_to = $key_progress.value
	update()
	
	if item.entered_dialog_zone and unlocked == false:
		$prompt.visible = true
	else:
		$prompt.visible = false