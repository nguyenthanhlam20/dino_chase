extends Node


var spring_enemies = [
	{
		"index": 0,
		"enemy_name": "Oscar",
		"description": "this is oscar",
		"unlock_at": 0,
		"lock_message": "unlock at 0m",
		"avatar": "res://Game/Characters/Enemies/Spring/Oscar/OscarAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Oscar/Oscar.tscn",
		"color": "#FBAA60"
	},
	{
		"index": 1,
		"enemy_name": "Amanita",
		"description": "this is a Squirrel",
		"unlock_at": 10,
		"lock_message": "unlock at score 100m",
		"avatar": "res://Game/Characters/Enemies/Spring/Amanita/AmanitaAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Amanita/Amanita.tscn",
		"color": "#F79489"
	},
	{
		"index": 2,
		"enemy_name": "Coolio",
		"description": "Snails don't have teeth",
		"unlock_at": 20,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Spring/Coolio/CoolioAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Coolio/Coolio.tscn",
		"color": "#60A3D9"
	},
	
	{
		"index": 3,
		"enemy_name": "Zoe",
		"description": "this is a Zoe",
		"unlock_at": 30,
		"lock_message": "unlock at score 15",
		"avatar": "res://Game/Characters/Enemies/Spring/Zoe/ZoeAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Zoe/Zoe.tscn",
		"color": "#A49393"
		
	},
	{
		"index": 4,
		"enemy_name": "Chicken",
		"description": "this is a Chicken",
		"unlock_at": 40,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Spring/Chicken/ChickenAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Chicken/Chicken.tscn",
		"color": "#F67B50"
	},
	{
		"index": 5,
		"enemy_name": "Hunter",
		"description": "His dream to become bigger",
		"unlock_at": 50,
		"lock_message": "unlock at score 15",
		"avatar": "res://Game/Characters/Enemies/Spring/Hunter/HunterAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Hunter/Hunter.tscn",
		"color": "#32CD30"
	},
	{
		"index": 6,
		"enemy_name": "Snake",
		"description": "this is a Snake",
		"unlock_at": 60,
		"lock_message": "unlock at score 75",
		"avatar": "res://Game/Characters/Enemies/Spring/Snake/SnakeAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Snake/Snake.tscn",
		"color": "#FADCD9"
	},
	{
		"index": 7,
		"enemy_name": "Oviraptor",
		"description": "this is a Oviraptor",
		"unlock_at": 70,
		"lock_message": "unlock at score 75",
		"avatar": "res://Game/Characters/Enemies/Spring/Oviraptor/OviraptorAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Oviraptor/Oviraptor.tscn",
		"color": "#0E86D4"
	},
	{
		"index": 8,
		"enemy_name": "Jackson",
		"description": "this is a Jackson",
		"unlock_at": 80,
		"lock_message": "unlock at score 15",
		"avatar": "res://Game/Characters/Enemies/Spring/Jackson/JacksonAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Jackson/Jackson.tscn",
		"color": "#A0E7E5"
	},
	{
		"index": 9,
		"enemy_name": "Mango",
		"description": "this is a Mango",
		"unlock_at": 0,
		"lock_message": "unlock at score 50",
		"avatar": "res://Game/Characters/Enemies/Spring/Mango/MangoAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Mango/Mango.tscn",
		"color": "#F8AFA6"
		
	},
	{
		"index": 10,
		"enemy_name": "Fat Bird",
		"description": "this is a Fat Bird",
		"unlock_at": 0,
		"lock_message": "unlock at score 40",
		"avatar": "res://Game/Characters/Enemies/Spring/FatBird/FatBirdAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/FatBird/FatBird.tscn",
		"color": "#FFAEBC"
	},
	{
		"index": 11,
		"enemy_name": "Vampire",
		"description": "this is a Vampire",
		"unlock_at": 0,
		"lock_message": "unlock at score 70",
		"avatar": "res://Game/Characters/Enemies/Spring/Vampire/VampireAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Vampire/Vampire.tscn",
		"color": "#FF5C4D"
	},
	{
		"index": 12,
		"enemy_name": "Sam",
		"unlock_at": 0,
		"description": "this is a Sam",
		"lock_message": "unlock at score 30",
		"avatar": "res://Game/Characters/Enemies/Spring/Sam/SamAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Sam/Sam.tscn",
		"color": "#75E6DA"
		
	},
	{
		"index": 13,
		"enemy_name": "Spike",
		"description": "this is a Spike",
		"unlock_at": 0,
		"lock_message": "unlock at score 65",
		"avatar": "res://Game/Characters/Enemies/Spring/Spike/SpikeAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Spike/Spike.tscn",
		"color": "#ECF87F"
	},
	{
		"index": 14,
		"enemy_name": "Bunny",
		"description": "this is a Bunny",
		"unlock_at": 0,
		"lock_message": "unlock at score 25",
		"avatar": "res://Game/Characters/Enemies/Spring/Bunny/BunnyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Bunny/Bunny.tscn",
		"color": "#81B622"
		
	},
	{
		"index": 15,
		"enemy_name": "Cheeba",
		"description": "this is a Cheeba",
		"unlock_at": 0,
		"lock_message": "unlock at score 75",
		"avatar": "res://Game/Characters/Enemies/Spring/Cheeba/CheebaAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Cheeba/Cheeba.tscn",
		"color": "#A4E8E0"
	},
	{
		"index": 16,
		"enemy_name": "Drake",
		"description": "this is a Drake",
		"unlock_at": 0,
		"lock_message": "unlock at score 35",
		"avatar": "res://Game/Characters/Enemies/Spring/Drake/DrakeAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Drake/Drake.tscn",
		"color": "#E1C340"
	},
	{
		"index": 17,
		"enemy_name": "Radish",
		"description": "this is a Radish",
		"unlock_at": 0,
		"lock_message": "unlock at score 55",
		"avatar": "res://Game/Characters/Enemies/Spring/Radish/RadishAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Radish/Radish.tscn",
		"color": "#4CD7D0"
	},
	{
		"index": 18,
		"enemy_name": "Varbu",
		"description": "this is a Varbu",
		"unlock_at": 0,
		"lock_message": "unlock at score 75",
		"avatar": "res://Game/Characters/Enemies/Spring/Varbu/VarbuAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Varbu/Varbu.tscn",
		"color": "#FF5C4D"
	},
	{
		"index": 19,
		"enemy_name": "Bettle",
		"description": "this is a Bettle",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Spring/Bettle/BettleAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Bettle/Bettle.tscn",
		"color": "#F8C0C8"
	},
	{
		"index": 20,
		"enemy_name": "Plant",
		"description": "this is a Plant",
		"unlock_at": 0,
		"lock_message": "unlock at score 60",
		"avatar": "res://Game/Characters/Enemies/Spring/Plant/PlantAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Plant/Plant.tscn",
		"color": "#FFCD58"
	},
	{
		"index": 21,
		"enemy_name": "Plant",
		"description": "this is a Plant",
		"unlock_at": 0,
		"lock_message": "unlock at score 60",
		"avatar": "res://Game/Characters/Enemies/Spring/Plant/PlantAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Plant/Plant.tscn",
		"color": "#FFCD58"
	}
]

func get_enemies():
	return spring_enemies
