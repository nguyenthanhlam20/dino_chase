extends Node2D



var screens = {
	"HOME_SCREEN": "res://Game/UI/Screen/HomeScreen/HomeScreen.tscn",
	"CHARACTER_SCREEN": "res://Game/UI/Screen/CharacterScreen/CharacterScreen.tscn",
	"MAP_SCREEN": "res://Game/UI/Screen/MapScreen/MapScreen.tscn",
	"STATISTIC_SCREEN": "res://Game/UI/Screen/StatisticScreen/StatisticScreen.tscn",
	"SETTINGS_SCREEN": "res://Game/UI/Screen/SettingScreen/SettingsMenu.tscn",
	"COUNTDOWN_SCREEN": "res://Game/UI/Screen/CountDownScreen/CountDownScreen.tscn",
	"GAME_OVER_SCREEN": "res://Game/UI/Screen/GameOver/GameOver.tscn",
	"STATS_SCREEN": "res://Game/UI/Screen/StatisticScreen/StatsScreen/StatsScreen.tscn",
	"ENEMY_SCREEN": "res://Game/UI/Screen/StatisticScreen/EnemyScreen/EnemyScreen.tscn",
	"NOT_ENOUGH_SCREEN": "res://Game/UI/Screen/NotEnoughScreen/NotEnoughScreen.tscn",
	"CONFIRM_SCREEN": "res://Game/UI/Screen/ConfirmScreen/ConfirmScreen.tscn",
	"CONGRAT_SCREEN": "res://Game/UI/Screen/CongratScreen/CongratScreen.tscn",
	"COVER_BACKGROUND": "res://Game/UI/Screen/CoverBackground.tscn"
}

func get_screens():
	return screens


