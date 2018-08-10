extends Node2D

var hello = ["Hello", "world"]

func _ready():
	var hud = get_node("hud/list")
	
	for word in hello:
		var title = Label.new()
		title.set_text(word)
		hud.add_child(title)