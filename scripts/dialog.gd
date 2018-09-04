extends Container

onready var player = get_node('../../../player')

func _ready():
	player.connect('open_global_dialog', self, '_open')
	player.connect('close_global_dialog', self, '_close')

func _open():
	print('dialog open')
	self.visible = true
func _close():
	print('dialog closed')
	self.visible = false
