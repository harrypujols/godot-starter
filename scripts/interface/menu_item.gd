extends Button

var call = 'unassigned'
onready var indicator = find_node('indicator')
onready var label = find_node('label')
signal menu_item_selection
	
func _on_menu_item_pressed():
	emit_signal('menu_item_selection')

func _on_menu_item_focus_entered():
	indicator.set_visible_characters(1)
	label.set('custom_colors/font_color', global.color.white)

func _on_menu_item_focus_exited():
	indicator.set_visible_characters(0)
	label.set('custom_colors/font_color', global.color.grey)