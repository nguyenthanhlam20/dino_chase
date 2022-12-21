extends Node2D


var players = [
	{
		"index": 0,
		"character_name": "Tomato",
		"character_detail": "A dinosuar",
		"health": 2,
		"jump_force": 500,
		"invincible_time": 2,
		"color": Color("#f09b38"),
		"url": "res://Game/Characters/Players/Tomato/Tomato.tscn",
		"avatar": "res://Game/Characters/Players/Tomato/TomatoAvatar.tscn",
		"unlock": "res://Resource/Frame/tomato.png",
		"lock": "res://Resource/Frame/lock.png",
		"price": 0
	},
	{
		"index": 1,
		"character_name": "Fresh Pepper",
		"character_detail": "A fog",
		"health": 1,
		"jump_force": 700,
		"invincible_time": 2,
		"color": Color("#ce5948"),
		"url": "res://Game/Characters/Players/FreshPepper/FreshPepper.tscn",
		"avatar": "res://Game/Characters/Players/FreshPepper/FreshPepperAvatar.tscn",
		"unlock": "res://Resource/Frame/fresh_pepper.png",
		"lock": "res://Resource/Frame/lock.png",
		"price": 100,
		"buy_btn_normal": "res://Resource/Buy/Buy_100_1.png",
		"buy_btn_pressed": "res://Resource/Buy/Buy_100_2.png"
	},
	{
		"index": 2,
		"character_name": "Blue Berry",
		"character_detail": "A Pink Man",
		"health": 2,
		"jump_force": 500,
		"invincible_time": 2,
		"color": Color("#28936f"),
		"url": "res://Game/Characters/Players/Blueberry/Blueberry.tscn",
		"avatar": "res://Game/Characters/Players/Blueberry/BlueberryAvatar.tscn",
		"unlock": "res://Resource/Frame/blue_berry.png",
		"lock": "res://Resource/Frame/lock.png",
		"price": 500,
		"buy_btn_normal": "res://Resource/Buy/Buy_500_1.png",
		"buy_btn_pressed": "res://Resource/Buy/Buy_500_2.png"
	},
	{
		"index": 3,
		"character_name": "Rainbow",
		"character_detail": "A Virtual Guy",
		"health": 1,
		"jump_force": 700,
		"invincible_time": 2,
		"color": Color("#418cd0"),
		"url": "res://Game/Characters/Players/Rainbow/Rainbow.tscn",
		"avatar": "res://Game/Characters/Players/Rainbow/RainbowAvatar.tscn",
		"unlock": "res://Resource/Frame/rain_bow.png",
		"lock": "res://Resource/Frame/lock.png",
		"price": 1000,
		"buy_btn_normal": "res://Resource/Buy/Buy_1000_1.png",
		"buy_btn_pressed": "res://Resource/Buy/Buy_1000_2.png"
	}
]
var current_player_index = 0

func get_player_health():
	return players[current_player_index].get("health")

func get_current_player_fullname():
	var name = players[current_player_index].get("character_name")
	return name

func get_current_player_name():
	var name = players[current_player_index].get("character_name")
	return name.replace(" ", "_").to_lower()
	
func get_current_player():
	var url = players[current_player_index].get("url")
	var	player = load(url)
	return player.instance()
	
func get_current_avatar():
	var url = players[current_player_index].get("avatar")
	var	avatar = load(url)
	return avatar.instance()
		
func get_current_avatar_path():
	var url = players[current_player_index].get("avatar")
	return url
		
func get_current_player_color():
	var color = players[current_player_index].get("color")
	return color
