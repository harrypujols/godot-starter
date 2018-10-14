extends Node

onready var keyhole = self.get_parent()
onready var cat = get_node('/root/stage/cat/cat')

var open_door = 'It\'s unlocked!'

func _ready():
	keyhole.collectible = false
	cat.connect('key_acquired', self, '_on_key_acquired')

func _on_key_acquired():
	keyhole.collectible = true
	keyhole.dialog_data.passages[0].dialog = open_door
	keyhole.init()

