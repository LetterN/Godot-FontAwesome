@tool
extends Label

@export_range(0, 1000, 1) var icon_size: int = 16: set = set_icon_size
@export_enum("solid", "regular", "brands") var icon_type: String = "solid": set = set_icon_type
@export var icon_name: String = "": set = set_icon_name

const icon_fonts: Dictionary = {
	"solid": "res://addons/FontAwesome5/fa-solid-900.ttf",
	"regular": "res://addons/FontAwesome5/fa-regular-400.ttf",
	"brands": "res://addons/FontAwesome5/fa-brands-400.ttf"
}

const cheatsheet: Dictionary = preload("Cheatsheet.gd").cheatsheet_lut

func _init():
	size = Vector2(icon_size, icon_size)
	match icon_type:
		"solid", "regular", "brands":
			add_theme_font_override("font", load(icon_fonts[icon_type]))

func set_icon_size(new_size: int):
	icon_size = new_size
	add_theme_font_size_override("font_size", icon_size)
	size = Vector2(icon_size, icon_size)

func set_icon_type(type: String):
	icon_type = type
	match icon_type:
		"solid", "regular", "brands":
			set_icon_name(icon_name)

func set_icon_name(name: String):
	icon_name = name
	var iconcode = ""
	if icon_name in cheatsheet[icon_type]:
		iconcode = cheatsheet[icon_type][icon_name]
		set_text(iconcode)
