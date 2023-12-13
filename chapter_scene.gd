extends Control

@onready var rich_text_label = $RichTextLabel

var current_chapter_path = ""
var chapter_list = []


func load_chapter(chapter_path):
	current_chapter_path = chapter_path
	print("In chapter_scene: " + current_chapter_path)
	var file = FileAccess.open(chapter_path, FileAccess.READ)
	print(rich_text_label)
	rich_text_label.bbcode_text = file.get_as_text()
	file.close()

	# Update chapter_list for navigation
	# ...

# Implement Next, Previous, and Menu button logic
# ...
