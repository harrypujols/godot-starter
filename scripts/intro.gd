extends Node2D

var title = Label.new()
var hello = ["Hello", "world"]

func _ready():
	var hud = get_node("hud")
	title.set_text("Hello World")
	hud.add_child(title)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
