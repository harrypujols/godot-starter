extends Node

onready var keyhole = self.get_parent()
onready var cat = get_node('/root/stage/cat/cat')

var closed_door = 'It\'s locked.'
var open_door = 'Yeah, baby! It\'s unlocked!'

func _ready():
	keyhole.item_image = 'items/keyhole.png'
	keyhole.text_line = closed_door
	keyhole.collectible = false
	cat.connect('key_acquired', self, '_on_key_acquired')

func _on_key_acquired():
	print('key acquired from cat')
	keyhole.collectible = true
	keyhole.dialog_data.passages[0].dialog = open_door
	keyhole.init()

