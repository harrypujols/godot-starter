extends Button

var call = "unassigned"

func _on_menu_item_pressed():
	match call:
		"start":
			get_tree().change_scene("res://rooms/start.tscn")		
		"quit":
			get_tree().quit()		
		_:
			print(call)