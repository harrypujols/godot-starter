extends Area2D

signal enter_dialog_space
signal exit_dialog_space

func _on_npc_dialog_area_entered(area):
	emit_signal('enter_dialog_space')

func _on_npc_dialog_area_exited(area):
	emit_signal('exit_dialog_space')
