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
			var item_name = ' ' + items.pick
			if items.count > 1:
				item_name = item_name + 's'
			passage.dialog = 'You have ' + String(items.count) + item_name + '.'
		if passage.name == 'cat' and items.count == items.total:
			passage.link = 'success'
	
	if items.count == items.total and cat.interactions > 0:
		cat.dialog_entry = 'success'