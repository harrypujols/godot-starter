extends Node2D

func _on_exit_body_area_shape_entered(area_id, area, area_shape, self_shape):
	get_tree().change_scene('res://rooms/ending.tscn')
