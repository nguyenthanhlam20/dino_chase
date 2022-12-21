extends Label

onready var title_value = $CenterContainer/GridContainer/Title/Value
onready var game_time = $CenterContainer/GridContainer/GameTime
onready var runs = $CenterContainer/GridContainer/Runs
onready var character_completion = $CenterContainer/GridContainer/CharacterCompletion
onready var map_completion = $CenterContainer/GridContainer/MapCompletion
onready var enemy_completion = $CenterContainer/GridContainer/EnemyCompletion

func _ready():
	pass # Replace with function body.

func set_value(title, data):
	title_value.text = title
	game_time.set_value(data.game_time)
	runs.set_value(data.runs)
	character_completion.set_value(data.character_completion)
	map_completion.set_value(data.map_completion)
	enemy_completion.set_value(data.enemy_completion)
	
	
	var height = data.keys().size() * 19
#	print(height)
	self.rect_min_size.y = height
