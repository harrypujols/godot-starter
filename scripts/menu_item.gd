extends Button

var call = "unassigned"
onready var menu = get_node("../")

func _ready():
	self.connect("pressed", menu, "menu_select")
	
func _on_menu_item_pressed():
	emit_signal("pressed", call)