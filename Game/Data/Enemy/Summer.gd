extends Node


var summer_enemies = [
	{
		"index": 0,
		"enemy_name": "Turtle",
		"description": "this is a Turtle",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Turtle/TurtleAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Turtle/Turtle.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 1,
		"enemy_name": "Shiitake",
		"description": "this is a Shiitake",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Summer/Shiitake/ShiitakeAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Shiitake/Shiitake.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 2,
		"enemy_name": "Watery",
		"description": "this is a Watery",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Watery/WateryAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Watery/Watery.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 3,
		"enemy_name": "Frosty",
		"description": "this is a Frosty",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Frosty/FrostyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Frosty/Frosty.tscn",
		"color": "#ECE3F0"
		
		
	},
	{
		"index": 4,
		"enemy_name": "Olivia",
		"description": "this is a Olivia",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Summer/Olivia/OliviaAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Olivia/Olivia.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 5,
		"enemy_name": "Cobra",
		"description": "this is a Cobra",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Summer/Cobra/CobraAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Cobra/Cobra.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 6,
		"enemy_name": "Crocodile",
		"description": "this is a Crocodile",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Crocodile/CrocodileAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Crocodile/Crocodile.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 7,
		"enemy_name": "Angry Pig",
		"description": "this is a Angry Pig",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/AngryPig/AngryPigAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/AngryPig/AngryPig.tscn",
		"color": "#ECE3F0"
		
	},
	{
		"index": 8,
		"enemy_name": "Angry Ghost",
		"description": "this is a AngryGhost",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/AngryGhost/AngryGhostAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/AngryGhost/AngryGhost.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 9,
		"enemy_name": "Tharrin",
		"description": "this is a Tharrin",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Tharrin/TharrinAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Tharrin/Tharrin.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 10,
		"enemy_name": "Duck",
		"description": "this is a Duck",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Duck/DuckAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Duck/Duck.tscn",
		"color": "#ECE3F0"
		
		
	},
	{
		"index": 11,
		"enemy_name": "Henry",
		"description": "this is a Henry",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Henry/HenryAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Henry/Henry.tscn",
		"color": "#ECE3F0"
	
	},
	{
		"index": 12,
		"enemy_name": "Fire",
		"description": "this is a GumBot",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar":  "res://Game/Characters/Enemies/Summer/Fire/FireAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Fire/Fire.tscn",
		"color": "#ECE3F0"
	
	},
	{
		"index": 13,
		"enemy_name": "Crabby",
		"description": "this is a Crabby",
		"unlock_at": 0,
		"lock_message": "unlock at score 0",
		"avatar": "res://Game/Characters/Enemies/Summer/Crabby/CrabbyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Crabby/Crabby.tscn",
		"color": "#ECE3F0"
		
	},
	{
		"index": 14,
		"enemy_name": "Mig",
		"description": "this is a Mig",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Summer/Mig/MigAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Mig/Mig.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 15,
		"enemy_name": "Cucumber",
		"description": "this is a Cucumber",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Cucumber/CucumberAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Cucumber/Cucumber.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 16,
		"enemy_name": "Fierce Tooth",
		"description": "this is a FierceTooth",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/FierceTooth/FierceToothAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/FierceTooth/FierceTooth.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 17,
		"enemy_name": "Pink Star",
		"description": "this is a PinkStar",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/PinkStar/PinkStarAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/PinkStar/PinkStar.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 18,
		"enemy_name": "Whale",
		"description": "this is a Whale",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Whale/WhaleAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Whale/Whale.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 19,
		"enemy_name": "Alien",
		"description": "this is a Alien",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Alien/AlienAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Alien/Alien.tscn",
		"color": "#ECE3F0"
		
	},
	{
		"index": 20,
		"enemy_name": "Mage",
		"description": "this is a Mage",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Summer/Mage/MageAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Mage/Mage.tscn",
		"color": "#ECE3F0"
		
	},
	{
		"index": 21,
		"enemy_name": "Mage",
		"description": "this is a Mage",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Summer/Mage/MageAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Mage/Mage.tscn",
		"color": "#ECE3F0"
		
	}
]

func get_enemies():
	return summer_enemies
