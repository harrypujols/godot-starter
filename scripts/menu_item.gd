extends Button

var call = 'unassigned'
signal menu_selection
signal item_focused
	
func _on_menu_item_pressed():
	emit_signal('menu_selection')

func _on_menu_item_focus_entered():
	$indicator.visible = true
	emit_signal('item_focused')


func _on_menu_item_focus_exited():
	$indicator.visible = false
