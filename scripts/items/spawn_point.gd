extends Node2D

onready var spawn_points = get_tree().get_nodes_in_group('warps')
onready var player = get_node('/root/stage/player')
export var origin_name = 'point-a'
export var target_name = 'point-b'
export var exit = false
var target 

func _ready():
	if $spawn_area.get_children().size() == 0:
		set_spawn_shape()
	set_target()

func set_target():
	for warp in spawn_points:
		if warp.origin_name == target_name:
			target = warp
			
func set_spawn_shape():
	var spawn_shape = RectangleShape2D.new()
	var spawn_collision = CollisionShape2D.new()
	spawn_shape.set_extents(Vector2(16, 16))
	spawn_collision.set_shape(spawn_shape)
	$spawn_area.add_child(spawn_collision)

func _on_spawn_area_area_entered(area):
	if area == player.get_node('player_hitbox'):
		if target and target.exit:
			player.position = target.position
		
func _on_spawn_area_area_exited(area):
	if target:
		exit = false
		target.exit = true
