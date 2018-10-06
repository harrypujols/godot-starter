extends Node

var total
var count = 0
var pick = 'item'

signal item_collected

func _ready():
	total = self.get_children().size()
	for child in self.get_children():
		child.connect('collected', self, '_on_item_collected', [child.item_name])

func _on_item_collected(item):
	count += 1
	pick = item
	emit_signal('item_collected')