extends Control

onready var item = get_parent()
onready var item_sprite = item.get_node('item_sprite')
onready var item_area = item.get_node('item_area')
var unlockable_position = Vector2(0,0)
var shape = CircleShape2D.new()
var collision = CollisionShape2D.new()
var key_pressed = false

func _ready():
	item.dialog_active = false
	set_unlockable_area()

func _input(event):
	if Input.is_action_pressed('ui_accept') and item.entered_dialog_zone:
		key_pressed = true
	else:
		key_pressed = false
		$key_progress.value = 0
	
func set_unlockable_area():
	var image_size = item_sprite.texture.get_size()
	shape.set_radius(2 * image_size.y)
	
	for child in item_area.get_children():
		child.queue_free()
		
	collision.set_shape(shape)
	item_area.add_child(collision)

func draw_circle_arc(center, radius, angle_from, angle_to, color):
    var nb_points = 32
    var points_arc = PoolVector2Array()

    for i in range(nb_points+1):
        var angle_point = deg2rad(angle_from + i * (angle_to-angle_from) / nb_points - 90)
        points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

    for index_point in range(nb_points):
        draw_line(points_arc[index_point], points_arc[index_point + 1], color)

func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PoolVector2Array()
	points_arc.push_back(center)
	var colors = PoolColorArray([color])
	
	for i in range(nb_points+1):
		var angle_point = deg2rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	
	draw_polygon(points_arc, colors)

func _draw():
	var center = item.position
	var radius = 80
	var angle_from = 75
	var angle_to = 195
	var color = Color(1.0, 0.0, 0.0)
	draw_circle_arc(center, radius, angle_from, angle_to, color)
	draw_circle_arc_poly(center, radius, angle_from, angle_to, color)
	
func _process(delta):
	if key_pressed:
		$key_progress.value += delta * $key_progress.max_value
		if $key_progress.value >= $key_progress.max_value:
			print('baddabing!')
			$key_progress.value = 0
