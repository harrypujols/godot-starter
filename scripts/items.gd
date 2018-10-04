extends Node

var total
var count = 0

func _ready():
	total = self.get_children().size()
