@tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("FontAwesome", "Label", preload("res://addons/fontawesome/FontAwesome.gd"), preload("res://addons/fontawesome/flag-solid.svg"))

func _exit_tree():
	remove_custom_type("FontAwesome")
