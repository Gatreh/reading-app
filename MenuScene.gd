extends Control

var chapters = []  # List of chapter file paths

func _ready():
	load_chapter_list("res://Books/Naruto: The Blind Swordsman")
	create_chapter_buttons()

func load_chapter_list(book_folder):
	var dir = DirAccess.open(book_folder)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !file_name.begins_with(".") and file_name.ends_with(".txt"):
				chapters.append(book_folder + "/" + file_name)
			file_name = dir.get_next()
		dir.list_dir_end()

func create_chapter_buttons():
	for chapter in chapters:
		var button = Button.new()
		button.text = chapter.get_file().get_basename()
		button.pressed.connect(_on_ChapterButton_pressed(chapter))
		$VBoxContainer.add_child(button)

func _on_ChapterButton_pressed(chapter_path):
	# Load ChapterScene and pass the chapter_path
	var chapter_scene = preload("res://chapter_scene.tscn").instantiate()
#	get_tree().change_scene_to(chapter_scene)
	chapter_scene.call_deferred("load chapter", chapter_path)
