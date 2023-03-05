@tool
extends Label

@export_range(0, 1000, 1) var icon_size: int = 16: set = set_icon_size
@export_enum("solid", "regular", "brands") var icon_type: String = "solid": set = set_icon_type
@export var icon_name: String = "": set = set_icon_name

const icon_font: Dictionary = {
	"solid": preload("fa-solid-900.ttf"),
	"regular": preload("fa-regular-400.ttf"),
	"brands": preload("fa-brands-400.ttf")
}

const cheatsheet: Dictionary = preload("Cheatsheet.gd").cheatsheet_lut

var font: FontFile = FontFile.new()

func _init():
	match icon_type:
		"solid", "regular", "brands":
			font.set_font_data(icon_font[icon_type])
			set("custom_fonts/font", font)

func set_icon_size(size: int):
	icon_size = size
	font.set_size(icon_size)

func set_icon_type(type: String):
	icon_type = type
	match icon_type:
		"solid", "regular", "brands":
			font.set_font_data(icon_font[icon_type])
			set_icon_name(icon_name)

func set_icon_name(name: String):
	icon_name = name
	var iconcode = ""
	if icon_name in cheatsheet[icon_type]:
		iconcode = cheatsheet[icon_type][icon_name]
		set_text(iconcode)
