extends Node

onready var cat = self.get_parent()


func _ready():
	cat.character_file = 'cat.json'
	cat.data = global.get_json('res://data/' + cat.character_file)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
