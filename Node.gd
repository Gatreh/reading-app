extends Node2D

@onready var rich_text_label = $ScrollContainer/RichTextLabel

func _ready():
	var file_path = "res://132.txt"
	var file = FileAccess.open(file_path, FileAccess.READ) # Updated to FileAccess
	print("test")
	if file: # Checks if the file opened successfully
		var text = file.get_as_text()
		print("test1")
		rich_text_label.bbcode_text = text
		file.close()
	else:
		print("test2")
		var error = FileAccess.get_open_error() # Retrieve the last error if the file did not open
		rich_text_label.bbcode_text = "File not found: " + str(error)
		print(error)
