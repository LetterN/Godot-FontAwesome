@tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("FontAwesomeSVG", "TextureRect", preload("res://addons/fontawesome/FontAwesomeSVG.gd"), preload("res://addons/fontawesome/flag-solid.svg"))

func _exit_tree():
	remove_custom_type("FontAwesomeSVG")
