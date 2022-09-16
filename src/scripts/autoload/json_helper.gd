extends Node

func key_value(json_path, json_file, key):
	var result = ""
	var file = File.new()
	var full_path = str(json_path + json_file);	
	if file.file_exists(full_path):
		file.open(full_path, File.READ)
		var test_json_conv = JSON.new()
		test_json_conv.parse(file.get_as_text())
		result = test_json_conv.get_data()
		
	return result[key]
