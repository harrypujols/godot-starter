extends Button

var call = "unassigned"
signal menu_selection
	
func _on_menu_item_pressed():
	emit_signal("menu_selection")