extends Node2D

enum PLAYER {TOMATO, PEPPER, BERRY, RAINBOW}
var current_player = PLAYER.TOMATO

# Tomato
const TOMATO_NAME = "Tomato"
const TOMATO_DETAIL = "A dinosuar"
const TOMATO_HEALTH = 1
const TOMATO_INVINCIBLE_TIME = 2
const TOMATO_AVATAR = "res://Game/Characters/Players/Tomato/TomatoAvatar.tscn"
const TOMATO_LOCK = "res://Resource/Frame/lock.png"
const TOMATO_UNLOCK = "res://Resource/Frame/tomato.png"
const TOMATO_URL = "res://Game/Characters/Players/Tomato/Tomato.tscn"
const TOMATO_MOVE = "res://Game/Characters/Movement/TomatoMove.tscn"
const TOMATO_PRICE = 0

func get_current_player():
	match(current_player):
		PLAYER.TOMATO:
			return {}
		PLAYER.PEPPER:
			return Constants.PEPPER_MOVE
		PLAYER.BERRY:
			return Constants.BERRY_MOVE
		PLAYER.RAINBOW:
			return Constants.RAINBOW_MOVE
