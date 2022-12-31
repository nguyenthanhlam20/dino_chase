extends Node2D

enum MAP {SPRING, SUMMER, AUTUMN, WINTER}
var current_map = MAP.SPRING

var maps = [
	{
		"index": 0,
		"map_name": "Spring",
		"map_title": "res://Resource/Maps/spring_title.png",
		"map_icon": "res://Resource/Icons/spring_icon.png",
		"map_detail": "Spring have plants",
		"map_unlock": "res://Resource/Maps/spring_icon.png",
		"map_lock": "",
		"map_background" : "res://Game/Maps/Spring/SpringBackground.tscn",
		"color": "81B622",
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
		"map_background" : "res://Game/Maps/Summer/SummerBackground.tscn",
		"price": 200,
		"color": "FAC12F",
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
		"map_background" : "res://Game/Maps/Autumn/AutumnBackground.tscn",
		"price": 1000,
		"color": "914110",
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
		"map_background" : "res://Game/Maps/Winter/WinterBackground.tscn",
		"price": 2000,
		"color": "CADAE3",
		"buy_btn_normal": "res://Resource/Buy/Buy_2000_1.png",
		"buy_btn_pressed": "res://Resource/Buy/Buy_2000_2.png",
		"url": "res://Game/Maps/Winter/Winter.tscn"
	}
]

func get_map_info(key_info: String):
	return maps[current_map].get(key_info)

func get_map(map_index : int):
	return maps[map_index]
