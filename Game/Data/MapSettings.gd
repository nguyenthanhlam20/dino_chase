extends Node
var maps = [
	{
		"index": 0,
		"map_name": "Spring",
		"map_title": "res://Resource/Maps/spring_title.png",
		"map_icon": "res://Resource/Maps/flower-pot.png",
		"map_detail": "Spring have plants",
		"url": "res://Game/Maps/Spring/Spring.tscn"
	},
	{
		"index": 1,
		"map_name": "Summer",
		"map_title": "res://Resource/Maps/summer_title.png",
		"map_icon": "res://Resource/Maps/sun.png",
		"map_detail": "Summer have plants",
		"url": "res://Game/Maps/Summer/Summer.tscn"
	},
	{
		"index": 2,
		"map_name": "Autumn",
		"map_title": "res://Resource/Maps/autumn_title.png",
		"map_icon": "res://Resource/Maps/sun.png",
		"map_detail": "Autumn have plants",
		"url": "res://Game/Maps/Autumn/Autumn.tscn"
	},
	{
		"index": 3,
		"map_name": "Winter",
		"map_title": "res://Resource/Maps/winter_title.png",
		"map_icon": "res://Resource/Maps/sun.png",
		"map_detail": "Winter have plants",
		"url": "res://Game/Maps/Winter/Winter.tscn"
	}
]

var current_map_index = 0

func get_current_map():
	var url = maps[current_map_index].get("url")
	var map = load(url)
	return map.instance()
