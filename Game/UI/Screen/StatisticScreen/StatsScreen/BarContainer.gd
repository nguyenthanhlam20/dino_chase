extends HBoxContainer

onready var sprite = $IconContainer/Control/Sprite
onready var title = $Title
onready var value = $Value

func set_value(data):
#	print(data.sprite)
	sprite.texture = load(data.sprite)
	title.text = data.title
	value.text = data.value_format
