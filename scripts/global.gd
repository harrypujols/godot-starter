extends Node

var player = {
    'name': 'you',
    'state': 'move'
}

var pause = false

const color = {
    'white': Color('#ffffff'),
    'grey': Color('#aaaaaa'),
    'black': Color('#000000'),
    'light_green': Color('#9bbc0f'),
    'green': Color('#8bac0f'),
    'dark_green': Color('#306230'),
    'pitch_dark_green': Color('#0f380f')
}

var secret_item = false

# load json file
static func get_json(path):
    var file = File.new()
    file.open(path, file.READ)
    var text = file.get_as_text()
    file.close()
    var result_json = JSON.parse(text)
    if result_json.error == OK:
        var result = result_json.result
        return(result)
    else:
        print('Error: ', result_json.error)
        print('Error Line: ', result_json.error_line)
        print('Error String: ', result_json.error_string)
