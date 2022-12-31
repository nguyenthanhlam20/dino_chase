extends Node

var FILE_PATH = "user://adcscds.tres"
var data = {
	"general": {
		"coins": {
			"title": "Coins",
			"value": 8000,
			"value_format": "0", 
			"sprite": "res://Resource/Icons/time-96.png"
		},
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
	"best_distance": {
		"spring": {
			"title": "Spring",
			"value": 0,
			"value_format": "0", 
			"sprite": "res://Resource/Icons/spring_icon.png"
		},
		"summer": {
			"title": "Summer",
			"value": 0,
			"value_format": "0", 
			"sprite": "res://Resource/Icons/summer_icon.png"
		},
		"autumn": {
			"title": "Autumn",
			"value": 0,
			"value_format": "0", 
			"sprite": "res://Resource/Icons/autumn_icon.png"
		},
		"winter": {
			"title": "Winter",
			"value": 0,
			"value_format": "0", 
			"sprite": "res://Resource/Icons/winter_icon.png"
		}
	},
	"character_pick": {
		"tomato": {
			"title": "Tomato",
			"value": 0,
			"value_format": "0", 
			"sprite": "res://Resource/Icons/tomato_96.png"
		},
		"fresh_pepper": {
			"title": "Fresh Pepper",
			"value": 0,
			"value_format": "0", 
			"sprite": "res://Resource/Icons/fresh_pepper_96.png"
		},
		"blue_berry": {
			"title": "Blue Berry",
			"value": 0,
			"value_format": "0", 
			"sprite": "res://Resource/Icons/blue_berry_96.png"
		},
		"rainbow": {
			"title": "Rainbow",
			"value": 0,
			"value_format": "0", 
			"sprite": "res://Resource/Icons/rain_bow_90.png"
		}
	},
	"map_pick": {
		"spring": {
			"title": "Spring",
			"value": 0,
			"value_format": "0", 
			"sprite": "res://Resource/Icons/spring_icon.png"
		},
		"summer": {
			"title": "Summer",
			"value": 0,
			"value_format": "0", 
			"sprite": "res://Resource/Icons/summer_icon.png"
		},
		"autumn": {
			"title": "Autumn",
			"value": 0,
			"value_format": "0", 
			"sprite": "res://Resource/Icons/autumn_icon.png"
		},
		"winter": {
			"title": "Winter",
			"value": 0,
			"value_format": "0", 
			"sprite": "res://Resource/Icons/winter_icon.png"
		}
	},
	"settings": {
		"swap_input": false,
		"timer_status": false,
		"music_volume": 0,
		"effect_volume": 0,
	},
	"completion": {
		"character": [0],
		"map": [0],
		"enemy": {
			"spring": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
			"summer": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
			"autumn": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
			"winter": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
		}
	}
}

func get_user_info(key_parent: String, key_child: String):
	return data.get(key_parent).get(key_child).get("value")


func get_unlock_enemies():
	var map_unlock = data.completion.map
	var count = 0
	var map_index : int
	for map in MapSettings.maps:
		map_index = map.get("index")
		if(map_index in map_unlock):
			var map_name = map.get("map_name").to_lower()
			count += data.completion.enemy.get(map_name).size()
	return count

func format_data():
	data.general.game_time.value_format = Common.format_time(data.general.game_time.value)
	data.general.runs.value_format = Common.format_number(data.general.runs.value)
	
	data.general.character_completion.value_format = Common.format_percent(data.completion.character.size(), 4)
	data.general.map_completion.value_format = Common.format_percent(data.completion.map.size(), 4)
	
	var number_of_enemies = get_unlock_enemies()
	data.general.enemy_completion.value_format = Common.format_percent(number_of_enemies, 21 * 4)
	
	data.character_pick.tomato.value_format = Common.format_number(data.character_pick.tomato.value)
	data.character_pick.fresh_pepper.value_format = Common.format_number(data.character_pick.fresh_pepper.value)
	data.character_pick.blue_berry.value_format = Common.format_number(data.character_pick.blue_berry.value)
	data.character_pick.rainbow.value_format = Common.format_number(data.character_pick.rainbow.value)
	
	data.map_pick.spring.value_format = Common.format_number(data.map_pick.spring.value)
	data.map_pick.summer.value_format = Common.format_number(data.map_pick.summer.value)
	data.map_pick.autumn.value_format = Common.format_number(data.map_pick.autumn.value)
	data.map_pick.winter.value_format = Common.format_number(data.map_pick.winter.value)
	
	data.best_distance.spring.value_format = Common.format_distance(data.best_distance.spring.value)
	data.best_distance.summer.value_format = Common.format_distance(data.best_distance.summer.value)
	data.best_distance.autumn.value_format = Common.format_distance(data.best_distance.autumn.value)
	data.best_distance.winter.value_format = Common.format_distance(data.best_distance.winter.value)

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
	
func get_longest_distance(season: String):
	return data.get("best_distance").get(season).get("value")
