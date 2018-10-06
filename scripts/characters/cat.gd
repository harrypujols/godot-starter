extends Node

onready var cat = self.get_parent()
onready var items = get_node('../../items')


func _ready():
	cat.character_file = 'cat.json'
	cat.data = global.get_json('res://data/' + cat.character_file)
	items.connect('item_collected', self, '_on_item_collected')
	
func _on_item_collected():
	for passage in cat.data.passages:
		if passage.name == 'items':
			var item = ' item'
			if items.count > 1:
				item = ' items'
			passage.dialog = 'You have ' + String(items.count) + item
		if passage.name == 'cat' and items.count > 0:
			passage.link = 'items'
		if passage.name == 'cat' and items.count == items.total:
			passage.link = 'success'