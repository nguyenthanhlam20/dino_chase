extends Node2D
var maps = [
	{
		"index": 0,
		"map_name": "Spring",
		"map_title": "res://Resource/Maps/spring_title.png",
		"map_icon": "res://Resource/Icons/spring_icon.png",
		"map_detail": "Spring have plants",
		"map_unlock": "res://Resource/Maps/spring_icon.png",
		"map_lock": "",
		"color": Color("81B622"),
		"price": 0,
		"buy_btn_normal": "",
		"buy_btn_pressed": "",
		"url": "res://Game/Maps/Spring/Spring.tscn"
	},
	{
		"index": 1,
		"map_name": "Summer",
		"map_title": "res://Resource/Maps/summer_title.png",
		"map_icon": "res://Resource/Icons/summer_icon.png",
		"map_detail": "Summer have plants",
		"map_unlock": "res://Resource/Maps/summer_icon.png",
		"map_lock": "res://Resource/Maps/summer_icon_lock.png",
		"price": 200,
		"color": Color("FAC12F"),
		"buy_btn_normal": "res://Resource/Buy/Buy_200_1.png",
		"buy_btn_pressed": "res://Resource/Buy/Buy_200_2.png",
		"url": "res://Game/Maps/Summer/Summer.tscn"
	},
	{
		"index": 2,
		"map_name": "Autumn",
		"map_title": "res://Resource/Maps/autumn_title.png",
		"map_icon": "res://Resource/Icons/autumn_icon.png",
		"map_detail": "Autumn have plants",
		"map_lock": "res://Resource/Maps/autumn_icon_lock.png",
		"map_unlock": "res://Resource/Maps/autumn_icon.png",
		"price": 1000,
		"color": Color("914110"),
		"buy_btn_normal": "res://Resource/Buy/Buy_1000_1.png",
		"buy_btn_pressed": "res://Resource/Buy/Buy_1000_2.png",
		"url": "res://Game/Maps/Autumn/Autumn.tscn"
	},
	{
		"index": 3,
		"map_name": "Winter",
		"map_title": "res://Resource/Maps/winter_title.png",
		"map_icon": "res://Resource/Icons/winter_icon.png",
		"map_detail": "Winter have plants",
		"map_unlock": "res://Resource/Maps/winter_icon.png",
		"map_lock": "res://Resource/Maps/winter_icon_lock.png",
		"price": 2000,
		"color": Color("CADAE3"),
		"buy_btn_normal": "res://Resource/Buy/Buy_2000_1.png",
		"buy_btn_pressed": "res://Resource/Buy/Buy_2000_2.png",
		"url": "res://Game/Maps/Winter/Winter.tscn"
	}
]

var current_map_index = 0

func get_current_map_avatar():
	var map_icon = maps[current_map_index].get("map_unlock")
	return map_icon

func get_current_map():
	var url = maps[current_map_index].get("url")
	var map = load(url)
	return map.instance()
	
func get_current_map_name():
	var name = maps[current_map_index].get("map_name")
	return name.to_lower()
	
func get_current_map_fullname():
	var name = maps[current_map_index].get("map_name")
	return name
	
func get_current_map_color():
	var color = maps[current_map_index].get("color")
	return color
	
