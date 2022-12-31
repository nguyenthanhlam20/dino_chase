extends Node2D

enum PLAYER {TOMATO, PEPPER, BERRY, RAINBOW}
var current_player = PLAYER.TOMATO

var players = [
	{
		"index": 0,
		"key_name": "tomato",
		"character_name": "Tomato",
		"character_detail": "A dinosuar",
		"health": 1,
		"invincible_time": 2,
		"color": "#f09b38",
		"frame": "res://Game/Characters/Players/Tomato/Tomato.tres",
		"unlock": "res://Resource/Frame/tomato.png",
		"lock": "res://Resource/Frame/lock.png",
		"move": "res://Game/Characters/Movement/TomatoMove.tscn",
		"price": 0
	},
	{
		"index": 1,
		"key_name": "fresh_pepper",
		"character_name": "Fresh Pepper",
		"character_detail": "A fog",
		"health": 2,
		"invincible_time": 2,
		"color": "#ce5948",
		"frame": "res://Game/Characters/Players/FreshPepper/FreshPepper.tres",
		"unlock": "res://Resource/Frame/fresh_pepper.png",
		"lock": "res://Resource/Frame/lock.png",
		"move": "res://Game/Characters/Movement/FreshPepperMove.tscn",
		"price": 100,
		"buy_btn_normal": "res://Resource/Buy/Buy_100_1.png",
		"buy_btn_pressed": "res://Resource/Buy/Buy_100_2.png"
	},
	{
		"index": 2,
		"key_name": "blue_berry",
		"character_name": "Blue Berry",
		"character_detail": "A Pink Man",
		"health": 3,
		"invincible_time": 2,
		"color": "#28936f",
		"frame": "res://Game/Characters/Players/Blueberry/Blueberry.tres",
		"unlock": "res://Resource/Frame/blue_berry.png",
		"lock": "res://Resource/Frame/lock.png",
		"move": "res://Game/Characters/Movement/BlueberryMove.tscn",
		"price": 500,
		"buy_btn_normal": "res://Resource/Buy/Buy_500_1.png",
		"buy_btn_pressed": "res://Resource/Buy/Buy_500_2.png"
	},
	{
		"index": 3,
		"key_name": "rainbow",
		"character_name": "Rainbow",
		"character_detail": "A Virtual Guy",
		"health": 4,
		"invincible_time": 2,
		"color": "#418cd0",
		"frame": "res://Game/Characters/Players/Rainbow/Rainbow.tres",
		"unlock": "res://Resource/Frame/rain_bow.png",
		"lock": "res://Resource/Frame/lock.png",
		"move": "res://Game/Characters/Movement/RainbowMove.tscn",
		"price": 1000,
		"buy_btn_normal": "res://Resource/Buy/Buy_1000_1.png",
		"buy_btn_pressed": "res://Resource/Buy/Buy_1000_2.png"
	}
]

func get_player_info(key_info : String):
	return players[current_player].get(key_info)

func get_player(index : int):
	return players[index] 
