extends Node

var autumn_enemies = [
	{
		"index": 0,
		"enemy_name": "Fox",
		"description": "this is a Fox",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Autumn/Fox/FoxAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Fox/Fox.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 1,
		"enemy_name": "Oyster",
		"description": "this is a Oyster",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Autumn/Oyster/OysterAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Oyster/Oyster.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 2,
		"enemy_name": "Peter",
		"description": "this is a Peter",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Peter/PeterAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Peter/Peter.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 3,
		"enemy_name": "Coco",
		"description": "this is a Coco",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Autumn/Coco/CocoAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Coco/Coco.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 4,
		"enemy_name": "Fairy",
		"description": "this is a Fairy",
		"unlock_at": 0,
		"lock_message": "unlock at score 75",
		"avatar": "res://Game/Characters/Enemies/Autumn/Fairy/FairyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Fairy/Fairy.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 5,
		"enemy_name": "Foggy",
		"description": "this is a Fog",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Autumn/Fog/FogAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Fog/Fog.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 6,
		"enemy_name": "Rock Head",
		"description": "this is a Fog",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Autumn/RockHead/RockHeadAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/RockHead/RockHead.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 7,
		"enemy_name": "Ghost",
		"description": "this is a Ghost",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Ghost/GhostAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Ghost/Ghost.tscn",
		"color": "#ECE3F0"
		
	},
	{
		"index": 8,
		"enemy_name": "Assassin",
		"description": "this is a Assassin",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Assassin/AssassinAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Assassin/Assassin.tscn",
		"color": "#ECE3F0"
		
	},
	{
		"index": 9,
		"enemy_name": "Evil Chest",
		"description": "this is a Evil Chest",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Autumn/EvilChest/EvilChestAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/EvilChest/EvilChest.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 10,
		"enemy_name": "Bearie",
		"description": "this is a Bearie",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Bearie/BearieAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Bearie/Bearie.tscn",
		"color": "#ECE3F0"
	
	},
	{
		"index": 11,
		"enemy_name": "Mosquito",
		"description": "this is a Mosquito",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Mosquito/MosquitoAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Mosquito/Mosquito.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 12,
		"enemy_name": "Edie",
		"description": "this is a Edie",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Edie/EdieAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Edie/Edie.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 13,
		"enemy_name": "Baty",
		"description": "this is a bat",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Autumn/Bat/BatAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Bat/Bat.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 14,
		"enemy_name": "Orange",
		"description": "this is a Orange",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Orange/OrangeAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Orange/Orange.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 15,
		"enemy_name": "Eye",
		"description": "this is a Eye",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Eye/EyeAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Eye/Eye.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 16,
		"enemy_name": "Orc",
		"description": "this is a Orc",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Orc/OrcAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Orc/Orc.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 17,
		"enemy_name": "Chameleon",
		"description": "this is a Chameleon",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Autumn/Chameleon/ChameleonAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Chameleon/Chameleon.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 18,
		"enemy_name": "Grizzly",
		"description": "this is a Grizzly",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Grizzly/GrizzlyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Grizzly/Grizzly.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 19,
		"enemy_name": "Trunk",
		"description": "this is a Trunk",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Trunk/TrunkAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Trunk/Trunk.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 20,
		"enemy_name": "Pig",
		"description": "this is a Pig",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Pig/PigAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Pig/Pig.tscn",
		"color": "#ECE3F0"
		
	},
	{
		"index": 21,
		"enemy_name": "Pig",
		"description": "this is a Pig",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Pig/PigAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Pig/Pig.tscn",
		"color": "#ECE3F0"
		
	}
	
]

func get_enemies():
	return autumn_enemies
