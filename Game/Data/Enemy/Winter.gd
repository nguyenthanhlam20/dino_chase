extends Node


var winter_enemies = [
	{
		"index": 0,
		"enemy_name": "Reindeer",
		"description": "this is a Reindeer",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Reindeer/ReindeerAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Reindeer/Reindeer.tscn",
		"color": "#ECE3F0"
		
	},
	{
		"index": 1,
		"enemy_name": "Chilly Willy",
		"description": "this is a ChillyWilly",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/ChillyWilly/ChillyWillyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/ChillyWilly/ChillyWilly.tscn",
		"color": "#ECE3F0"
		
	},
	{
		"index": 2,
		"enemy_name": "Blankey",
		"description": "this is a bat",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Winter/Blankey/BlankeyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Blankey/Blankey.tscn",
		"color": "#ECE3F0"
		
	},
	{
		"index": 3,
		"enemy_name": "Enokitake",
		"description": "this is a Enokitake",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Enokitake/EnokitakeAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Enokitake/Enokitake.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 4,
		"enemy_name": "Snowman",
		"description": "this is a Snowman",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Snowman/SnowmanAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Snowman/Snowman.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 5,
		"enemy_name": "Scotty",
		"description": "this is a Scotty",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Winter/Scotty/ScottyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Scotty/Scotty.tscn",
		"color": "#ECE3F0"

		
	},
	{
		"index": 6,
		"enemy_name": "Skeleton",
		"description": "this is a Skeleton",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Winter/Skeleton/SkeletonAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Skeleton/Skeleton.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 7,
		"enemy_name": "Dragoon",
		"description": "this is a Dragoon",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Dragoon/DragoonAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Dragoon/Dragoon.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 8,
		"enemy_name": "Rino",
		"description": "this is a Rino",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Winter/Rino/RinoAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Rino/Rino.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 9,
		"enemy_name": "Mimic",
		"description": "this is a Mimic",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Mimic/MimicAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Mimic/Mimic.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 10,
		"enemy_name": "Shadow",
		"description": "this is a Shadow",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Shadow/ShadowAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Shadow/Shadow.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 11,
		"enemy_name": "King Pig",
		"description": "this is a KingPig",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Winter/KingPig/KingPigAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/KingPig/KingPig.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 12,
		"enemy_name": "Saw",
		"description": "this is a Saw",
		"unlock_at": 0,
		"lock_message": "unlock at score 75",
		"avatar":"res://Game/Characters/Enemies/Winter/Saw/SawAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Saw/Saw.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 13,
		"enemy_name": "Blast",
		"description": "this is a Blast",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Blast/BlastAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Blast/Blast.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 14,
		"enemy_name": "Sapphire",
		"description": "this is a Sapphire",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Sapphire/SapphireAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Sapphire/Sapphire.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 15,
		"enemy_name": "Axie",
		"description": "this is a Axie",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Axie/AxieAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Axie/Axie.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 16,
		"enemy_name": "Umbra",
		"description": "this is a Umbra",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Umbra/UmbraAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Umbra/Umbra.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 17,
		"enemy_name": "Ice Cream",
		"description": "this is a Ice Cream",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Winter/IceCream/IceCreamAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/IceCream/IceCream.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 18,
		"enemy_name": "Big Mouth",
		"description": "this is a BigMouth",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Winter/BigMouth/BigMouthAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/BigMouth/BigMouth.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 19,
		"enemy_name": "Santa",
		"description": "this is a Santa",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Santa/SantaAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Santa/Santa.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 20,
		"enemy_name": "Pika Pika",
		"description": "this is a Pikachu",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Pikachu/PikachuAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Pikachu/Pikachu.tscn",
		"color": "#ECE3F0"
	},
	{
		"index": 21,
		"enemy_name": "Pika Pika",
		"description": "this is a Pikachu",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Pikachu/PikachuAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Pikachu/Pikachu.tscn",
		"color": "#ECE3F0"
	}
	
]

func get_enemies():
	return winter_enemies
