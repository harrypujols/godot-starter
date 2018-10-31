extends Node

onready var cat = self.get_parent()
onready var items = get_node('/root/stage/items')

signal key_acquired

func interpolate_data():
	var data = global.get_json('res://data/' + cat.character_file)
	var item_name = items.item_name + 's'
	var count = 'no'
	
	for passage in data.passages:
		if passage.name == 'question' or passage.name == 'success':
			passage.dialog = passage.dialog.format({'items': item_name})
			
		if passage.name == 'items':
			if items.count > 0:
				count = String(items.count)
			if items.count == 1:
				item_name = items.item_name
			else:
				item_name = items.item_name + 's'
			passage.dialog = passage.dialog.format({'count': count, 'items': item_name})
			
		if passage.name == 'cat' and items.count == items.total:
			passage.link = 'success'
			
	cat.data = data

func _ready():
	cat.connect('interacted', self, '_on_cat_interaction')
	items.connect('item_collected', self, '_on_item_collected')
	items.connect('items_ready', self, '_on_items_ready')

func _on_items_ready():
	interpolate_data()
	
func _on_item_collected():
	interpolate_data()
	if items.count == items.total and cat.interactions > 0:
		cat.dialog_entry = 'success'

func _on_cat_interaction():
	if items.count == items.total and cat.dialog_entry == 'again':
		emit_signal('key_acquired')

func _on_dialog_zone_area_entered(area):
	interpolate_data()