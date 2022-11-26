extends Label

onready var title_value = $CenterContainer/GridContainer/Title/Value
onready var distance = $CenterContainer/GridContainer/Distance
onready var score = $CenterContainer/GridContainer/Score

func _ready():
	pass # Replace with function body.

func set_value(title, data):
#	print(data.distance)
	title_value.text = title
	distance.set_value(data.distance)
	score.set_value(data.score)
	
	var height = (distance.rect_size.y * (data.keys().size() + 1)) + 40
#	print(height)
	self.rect_min_size.y = height
	
