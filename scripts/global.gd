extends Node

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

func dialog(state):
	match state:
		'open':
			print('entered npc zone')
		'closed':
			print('exited npc zone')
		_:
			print(state)