extends Node2D

onready var spawn_points = get_tree().get_nodes_in_group('warps')
onready var player = get_node('/root/stage/player')
export var origin_name = 'point-a'
export var target_name = 'point-b'
export var exit = false
onready var origin = position
var target 

func _ready():
	set_target()
	print(origin)

func set_target():
	for warp in spawn_points:
		if warp.origin_name == target_name:
			target = warp

func _on_spawn_area_area_entered(area):
	if area == player.get_node('player_hitbox'):
		if target and target.exit:
			player.position = target.position
		
func _on_spawn_area_area_exited(area):
	if target and exit:
		exit = false
		target.exit = true
