extends Node2D

var spawn_points = get_tree().get_nodes_in_group('spawns')
var origin_name = 'point-a'
var target_name = 'point-b'
var origin = self.get_pos()
var target 

func _ready():
	set_target()

func set_target():
	for point in spawn_points:
		if point.name == target_name:
			target = point.get_pos()

func _on_spawn_area_area_entered(area):
	print(area)
