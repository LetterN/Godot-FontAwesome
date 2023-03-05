@tool
extends TextureRect

@export_category("FontAwesome")
@export_range(1, 16384) var icon_size: int = 16: set = set_icon_size
@export_enum("solid", "regular", "brands") var icon_type: String = "solid": set = set_icon_type
@export var icon_name: String = "circle-question": set = set_icon_name

const icon_paths: Dictionary = {
	"solid": "res://addons/fontawesome/svg/solid/",
	"regular": "res://addons/fontawesome/svg/regular/",
	"brands": "res://addons/fontawesome/svg/brands/"
}

func _init():
	expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	stretch_mode = TextureRect.STRETCH_KEEP_ASPECT
	set_icon_type(icon_type)
	set_icon_size(icon_size)
	set_icon_name(icon_name)

func set_icon_size(new_size: int):
	icon_size = clamp(new_size, 1, 16384)
	size = Vector2(icon_size, icon_size)

func set_icon_type(new_type: String):
	icon_type = new_type
	var img: Texture2D = load(icon_paths[icon_type] + icon_name + ".svg")
	if !img:
		texture = null
		return
	texture = img

func set_icon_name(new_name: String):
	icon_name = new_name
	if !icon_name.length():
		texture = null
		return
	var img: Texture2D = load(icon_paths[icon_type] + icon_name + ".svg")
	if !img:
		texture = null
		return
	texture = img
