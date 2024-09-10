extends VBoxContainer

onready var items = get_node('items')
onready var title = get_node('title')
var data = {}
var selection
var get_menu_item = load('res://interface/menu_item.tscn')
signal menu_selection

func _ready():
    self.set('custom_constants/separation', 16)
    
func init():
    if items.get_children().size() > 0:
        for child in items.get_children():
            child.queue_free()
            items.remove_child(child)
            
    for item in data:
        var menu_item = get_menu_item.instance()
        items.add_child(menu_item)
        var label = menu_item.find_node('label')
        label.set_text(item.label)
        label.set('custom_colors/font_color', global.color.grey)
        menu_item.call = item.call
        menu_item.connect('menu_item_selection', self, '_on_menu_item_selected', [menu_item.call])
        
    items.get_child(0).grab_focus()
    items.get_child(0).find_node('label').set('custom_colors/font_color', global.color.white)

func _on_menu_item_selected(call):
    selection = call
    emit_signal('menu_selection')
