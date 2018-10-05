extends Node

var total
var count = 0

func _ready():
	total = self.get_children().size()
	for child in self.get_children():
		child.connect('collected', self, '_on_item_collected')

func _on_item_collected():
	count += 1