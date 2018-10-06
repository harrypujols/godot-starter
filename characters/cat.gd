extends Node

onready var cat = self.get_parent()
onready var items = get_node('../../items')


func _ready():
	cat.character_file = 'cat.json'
	cat.data = global.get_json('res://data/' + cat.character_file)
	items.connect('item_collected', self, '_on_item_collected')
	
func _on_item_collected():
	print(items.count)