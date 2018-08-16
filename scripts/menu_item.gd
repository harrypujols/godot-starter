extends Button

var call = "unassigned"
signal menu_select
	
func _on_menu_item_pressed():
	emit_signal("menu_select")