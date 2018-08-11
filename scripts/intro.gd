extends Node2D

func _ready():
	var dir = Directory.new()
	dir.copy("res://data/", "user://")
