extends Node

onready var item = get_parent()

func _ready():
	item.dialog_active = false
	item.item_image = 'items/chest.png'