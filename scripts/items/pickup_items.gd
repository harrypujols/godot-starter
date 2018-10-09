extends Node

onready var coins = get_tree().get_nodes_in_group('coins')
var total
var count = 0
var pick = 'item'

signal item_collected

func _ready():
	total = coins.size()
	for coin in coins:
		coin.connect('collected', self, '_on_item_collected', [coin.item_name])

func _on_item_collected(item):
	$bleep.play('blop')
	count += 1
	pick = item
	emit_signal('item_collected')