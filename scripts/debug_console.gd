extends VBoxContainer

onready var dialog = get_node('../dialog')

func _process(delta):
	$clicks.set_text('clicks: ' + String(dialog.clicks))
	$current_page.set_text('current_page: ' + dialog.current_page)
	$next_page.set_text('next_page: ' + dialog.next_page)
