extends Node

var item_total
var item_count = 0

func _ready():
	item_total = self.get_children().size()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
