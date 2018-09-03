extends Polygon2D

var dialog_text = ['Hello, welcome to the dialog!']
var page = 0


func _ready(): 
	$dialog_text.set_text(dialog_text[page])