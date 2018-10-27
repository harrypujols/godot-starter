extends Node

onready var cat = self.get_parent()
onready var items = get_node('/root/stage/items')

signal key_acquired

func interpolate_data():
	var item_name = items.item_name + 's'
	var count = 'no'
	
	for passage in cat.data.passages:
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

func _ready():
	cat.connect('interacted', self, '_on_cat_interaction')
	items.connect('item_collected', self, '_on_item_collected')

func _on_item_collected():
	print(items.count)
	interpolate_data()

	if items.count == items.total and cat.interactions > 0:
		cat.dialog_entry = 'success'

func _on_cat_interaction():
	if items.count == items.total and cat.dialog_entry == 'again':
		emit_signal('key_acquired')

func _on_dialog_zone_area_entered(area):
	interpolate_data()