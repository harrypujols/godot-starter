extends Node

onready var bleep = get_node('/root/stage/sounds/bleep')
var total
var count = 0
var pick = 'item'

signal item_collected

func _ready():
	total = self.get_children().size()
	for child in self.get_children():
		child.connect('collected', self, '_on_item_collected', [child.item_name])

func _on_item_collected(item):
	bleep.play('blop')
	count += 1
	pick = item
	emit_signal('item_collected')