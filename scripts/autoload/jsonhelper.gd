extends Node

func key_value(json_path, json_file, key):
	var result = ""
	var file = File.new()
	var full_path = str(json_path + json_file);	
	if file.file_exists(full_path):
		file.open(full_path, File.READ)
		result = parse_json(file.get_as_text())
		
	return result[key]
