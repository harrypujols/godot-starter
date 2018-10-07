extends Node

onready var keyhole = self.get_parent()
var closed_door = 'It\'s locked.'
var open_door = 'Yeah, baby! It\'s unlocked!'

func _ready():
	keyhole.item_image = 'items/keyhole.png'
	keyhole.dialog_text = closed_door

