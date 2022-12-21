extends Label

onready var title_value = $CenterContainer/GridContainer/Title/Value
onready var tomato = $CenterContainer/GridContainer/Tomato
onready var fresh_pepper = $CenterContainer/GridContainer/FreshPepper
onready var blue_berry = $CenterContainer/GridContainer/BlueBerry
onready var rainbow = $CenterContainer/GridContainer/Rainbow
onready var character_unlock = User.data.completion.character
onready var characters = PlayerSettings.players

onready var container = $CenterContainer/GridContainer
var height : int
func _ready():
	pass # Replace with function body.

func set_value(title, data):
#	print(data.distance)
	title_value.text = title
	
	tomato.set_value(data.tomato)
	fresh_pepper.set_value(data.fresh_pepper)
	blue_berry.set_value(data.blue_berry)
	rainbow.set_value(data.rainbow)
	
	var index : int
	var count = 0
	var character_container : HBoxContainer
	for character in characters:
		index = character.get("index")
		character_container = container.get_node(character.get("character_name").replace(" ", ""))
		if(index in character_unlock):
			count += 1
			character_container.visible = true
		else:
			character_container.visible = false
	if(count % 2 == 1):
		height = ((count + 3) * 14) - 4
	else:
		height = (count + 3) * 14
#	print(height)
	self.rect_min_size.y = height
	
