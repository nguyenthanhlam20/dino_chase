extends Node

var FILE_PATH = "user://pspdssp.tres"

var data = {
	"general": {
		"game_time": {
			"title": "Game Time",
			"value": 0,
			"value_format": "0s", 
			"sprite": "res://Resource/Icons/time-96.png"
		},
		"runs": {
			"title": "Runs",
			"value": 0,
			"value_format": "0", 
			"sprite": "res://Resource/Icons/baratheon-house-96.png"
		},
		"character_completion": {
			"title": "Character Completion",
			"value": 0,
			"value_format": "0%", 
			"sprite": "res://Resource/Icons/character-96.png"
		},
		"map_completion": {
			"title": "Map Completion",
			"value": 0,
			"value_format": "0%", 
			"sprite": "res://Resource/Icons/map-completion-96.png"
		},
		"enemy_completion": {
			"title": "Enemy Completion",
			"value": 0,
			"value_format": "0%", 
			"sprite": "res://Resource/Icons/enemy-completion-96.png"
		}
	},
	"best": {
		"distance": {
			"title": "Distance",
			"value": 112345,
			"value_format": "0m", 
			"sprite": "res://Resource/Icons/best-distant-96.png"
		},
		"score": {
			"title": "Score",
			"value": 1000,
			"value_format": "1000", 
			"sprite": "res://Resource/Icons/best-score-96.png"
		}
	},
	"settings": {
		"swap_input": false,
		"timer_status": false,
		"music_volume": 0,
		"effect_volume": 0,
	},
	"completion": {
		"character": [0, 1, 2, 3],
		"map": [0, 1, 2, 3],
		"enemy": [0, 1, 2, 3]
	}
}

func format_data():
	var value = data.best.distance.value;
	var percent : String
#	var enemey_percent : String
	if(value < 1000000): 
		data.best.distance.value_format = str(value) + "m"
	else: 
		data.best.distance.value_format = str(value / 1000)  + "km"
	
	if(value >= 400):
		percent = "100%"
	elif(value >= 200):
		percent = "50%"
	elif(value >= 100): 
		percent = "25%"
	else: 
		percent = "0%"
	data.general.map_completion.value_format = percent
	
	value = data.best.score.value;
	if(value < 10000): 
		data.best.score.value_format = str(value)
	else: 
		data.best.score.value_format = str(value / 1000)  + "k"
		
		
	if(value >= 200):
		percent = "100%"
	elif(value >= 100):
		percent = "50%"
	elif(value >= 50): 
		percent = "25%"
	else: 
		percent = "0%"
	data.general.character_completion.value_format = percent
	
	value = data.general.game_time.value
	data.general.game_time.value_format = str(value) + "s"
	
	
	value = data.general.runs.value
	
	if(value > 100000):
		data.general.runs.value_format = str(value / 1000) + "k"
	else: 
		data.general.runs.value_format = str(value)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	get_user_data()

func get_user_data():
	var file = File.new()
	if(file.file_exists(FILE_PATH)):
		file.open(FILE_PATH, File.READ)
		data = parse_json(file.get_as_text())
		file.close()
	else:
		save_user_data()
				
func save_user_data():
	var file = File.new()
	file.open(FILE_PATH, File.WRITE)
	file.store_string(to_json(data))
	file.close()
	
	
