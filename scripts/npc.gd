extends StaticBody2D

onready var player = get_node('../player')
onready var dialog_box = get_node('../hud/interface/dialog')
onready var dialog_text = dialog_box.get_node('dialog_text')
export var character_name = 'npc'
var content = ['Hello...', 'I am evil you.']

func _ready():
	player.connect('open_global_dialog', self, '_open')
	player.connect('close_global_dialog', self, '_close')

func _open():
	dialog_text.content = content
	$alert_bubble.visible = true

func _close():
	$alert_bubble.visible = false

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
