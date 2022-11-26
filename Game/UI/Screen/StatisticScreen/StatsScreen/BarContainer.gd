extends HBoxContainer


onready var sprite = $IconContainer/Control/Sprite
onready var title = $Title
onready var value = $Value

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_value(data):
#	print(data.sprite)
	sprite.texture = load(data.sprite)
	title.text = data.title
	value.text = str(data.value_format)
