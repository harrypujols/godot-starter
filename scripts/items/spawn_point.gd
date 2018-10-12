extends Node2D

onready var spawn_points = get_tree().get_nodes_in_group('warps')
onready var player = get_node('/root/stage/player')
export var origin_name = 'point-a'
export var target_name = 'point-b'
var origin = self.position
var target 

func _ready():
	set_target()
	print(origin)
	print(player.position)

func set_target():
	for point in spawn_points:
		if point.origin_name == target_name:
			target = point.position
		else:
			print(point.origin_name)

func _on_spawn_area_area_entered(area):
	print('hello!')
	if area == player.get_node('player_hitbox'):
		if target != null:
			player.position = target
		
