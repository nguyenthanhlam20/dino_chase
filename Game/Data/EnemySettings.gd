extends Node2D


var spring_enemies = [
	{
		"index": 0,
		"enemy_name": "Oscar",
		"description": "this is oscar",
		"unlock_at": 0,
		"lock_message": "unlock at score 0",
		"avatar": "res://Game/Characters/Enemies/Spring/Oscar/OscarAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Oscar/Oscar.tscn"
	},
	{
		"index": 1,
		"enemy_name": "Amanita",
		"description": "this is a Squirrel",
		"unlock_at": 0,
		"lock_message": "unlock at score 5",
		"avatar": "res://Game/Characters/Enemies/Spring/Amanita/AmanitaAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Amanita/Amanita.tscn"
	},
	{
		"index": 2,
		"enemy_name": "Coolio",
		"description": "Snails don't have teeth",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Spring/Coolio/CoolioAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Coolio/Coolio.tscn"
	},
	{
		"index": 3,
		"enemy_name": "Fairy",
		"description": "this is a Fairy",
		"unlock_at": 0,
		"lock_message": "unlock at score 75",
		"avatar": "res://Game/Characters/Enemies/Spring/Fairy/FairyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Fairy/Fairy.tscn"
	},
	{
		"index": 4,
		"enemy_name": "Hunter",
		"description": "His dream to become bigger",
		"lock_message": "unlock at score 15",
		"avatar": "res://Game/Characters/Enemies/Spring/Hunter/HunterAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Hunter/Hunter.tscn"
	},
	{
		"index": 5,
		"enemy_name": "Chicken",
		"description": "this is a Chicken",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Spring/Chicken/ChickenAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Chicken/Chicken.tscn"
	},
	{
		"index": 6,
		"enemy_name": "Zoe",
		"description": "this is a Zoe",
		"unlock_at": 0,
		"lock_message": "unlock at score 15",
		"avatar": "res://Game/Characters/Enemies/Spring/Zoe/ZoeAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Zoe/Zoe.tscn"
	},
	{
		"index": 7,
		"enemy_name": "Bunny",
		"description": "this is a Bunny",
		"unlock_at": 0,
		"lock_message": "unlock at score 25",
		"avatar": "res://Game/Characters/Enemies/Spring/Bunny/BunnyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Bunny/Bunny.tscn"
	},
	{
		"index": 8,
		"enemy_name": "Sam",
		"description": "this is a Sam",
		"lock_message": "unlock at score 30",
		"avatar": "res://Game/Characters/Enemies/Spring/Sam/SamAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Sam/Sam.tscn"
	},
	{
		"index": 9,
		"enemy_name": "Jackson",
		"description": "this is a Jackson",
		"unlock_at": 0,
		"lock_message": "unlock at score 15",
		"avatar": "res://Game/Characters/Enemies/Spring/Jackson/JacksonAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Jackson/Jackson.tscn"
	},
	{
		"index": 10,
		"enemy_name": "Fat Bird",
		"description": "this is a Fat Bird",
		"unlock_at": 0,
		"lock_message": "unlock at score 40",
		"avatar": "res://Game/Characters/Enemies/Spring/FatBird/FatBirdAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/FatBird/FatBird.tscn"
	},
	{
		"index": 11,
		"enemy_name": "Kiwi",
		"description": "this is a Kiwi",
		"unlock_at": 0,
		"lock_message": "unlock at score 45",
		"avatar": "res://Game/Characters/Enemies/Spring/Kiwi/KiwiAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Kiwi/Kiwi.tscn"
	},
	{
		"index": 12,
		"enemy_name": "Snake",
		"description": "this is a Snake",
		"unlock_at": 0,
		"lock_message": "unlock at score 75",
		"avatar": "res://Game/Characters/Enemies/Spring/Snake/SnakeAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Snake/Snake.tscn"
	},
	{
		"index": 13,
		"enemy_name": "Vampire",
		"description": "this is a Vampire",
		"lock_message": "unlock at score 70",
		"avatar": "res://Game/Characters/Enemies/Spring/Vampire/VampireAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Vampire/Vampire.tscn"
	},
	{
		"index": 14,
		"enemy_name": "Oviraptor",
		"description": "this is a Oviraptor",
		"unlock_at": 0,
		"lock_message": "unlock at score 75",
		"avatar": "res://Game/Characters/Enemies/Spring/Oviraptor/OviraptorAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Oviraptor/Oviraptor.tscn"
	},
	{
		"index": 15,
		"enemy_name": "Spike",
		"description": "this is a Spike",
		"unlock_at": 0,
		"lock_message": "unlock at score 65",
		"avatar": "res://Game/Characters/Enemies/Spring/Spike/SpikeAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Spike/Spike.tscn"
	},
	{
		"index": 16,
		"enemy_name": "Mango",
		"description": "this is a Mango",
		"unlock_at": 0,
		"lock_message": "unlock at score 50",
		"avatar": "res://Game/Characters/Enemies/Spring/Mango/MangoAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Mango/Mango.tscn"
	},
	{
		"index": 17,
		"enemy_name": "Cheeba",
		"description": "this is a Cheeba",
		"unlock_at": 0,
		"lock_message": "unlock at score 75",
		"avatar": "res://Game/Characters/Enemies/Spring/Cheeba/CheebaAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Cheeba/Cheeba.tscn"
	},
	{
		"index": 18,
		"enemy_name": "Drake",
		"description": "this is a Drake",
		"unlock_at": 0,
		"lock_message": "unlock at score 35",
		"avatar": "res://Game/Characters/Enemies/Spring/Drake/DrakeAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Drake/Drake.tscn"
	},
	{
		"index": 19,
		"enemy_name": "Radish",
		"description": "this is a Radish",
		"unlock_at": 0,
		"lock_message": "unlock at score 55",
		"avatar": "res://Game/Characters/Enemies/Spring/Radish/RadishAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Radish/Radish.tscn"
	},
	{
		"index": 20,
		"enemy_name": "Varbu",
		"description": "this is a Varbu",
		"unlock_at": 0,
		"lock_message": "unlock at score 75",
		"avatar": "res://Game/Characters/Enemies/Spring/Varbu/VarbuAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Varbu/Varbu.tscn"
	},
	{
		"index": 21,
		"enemy_name": "Plant",
		"description": "this is a Plant",
		"unlock_at": 0,
		"lock_message": "unlock at score 60",
		"avatar": "res://Game/Characters/Enemies/Spring/Plant/PlantAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Plant/Plant.tscn"
	},
	{
		"index": 22,
		"enemy_name": "Roto",
		"description": "this is a Roto",
		"unlock_at": 0,
		"lock_message": "unlock at score 75",
		"avatar":"res://Game/Characters/Enemies/Spring/Roto/RotoAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Spring/Roto/Roto.tscn"
	}
]

var summer_enemies = [
	{
		"index": 0,
		"enemy_name": "Crabby",
		"description": "this is a Crabby",
		"unlock_at": 0,
		"lock_message": "unlock at score 0",
		"avatar": "res://Game/Characters/Enemies/Summer/Crabby/CrabbyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Crabby/Crabby.tscn"
	},
	{
		"index": 1,
		"enemy_name": "Octi",
		"description": "this is a Octi",
		"unlock_at": 0,
		"lock_message": "unlock at score 5",
		"avatar": "res://Game/Characters/Enemies/Summer/Octi/OctiAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Octi/Octi.tscn"
	},
	{
		"index": 2,
		"enemy_name": "Shiitake",
		"description": "this is a Shiitake",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Summer/Shiitake/ShiitakeAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Shiitake/Shiitake.tscn"
	},
	{
		"index": 3,
		"enemy_name": "Ballooney",
		"description": "this is a Ballooney",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Summer/Ballooney/BallooneyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Ballooney/Ballooney.tscn"
		
	},
	{
		"index": 4,
		"enemy_name": "Pink Star",
		"description": "this is a PinkStar",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/PinkStar/PinkStarAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/PinkStar/PinkStar.tscn"
	
	},
	{
		"index": 5,
		"enemy_name": "Cobra",
		"description": "this is a Cobra",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Summer/Cobra/CobraAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Cobra/Cobra.tscn"
		
	},
	{
		"index": 6,
		"enemy_name": "Olivia",
		"description": "this is a Olivia",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Summer/Olivia/OliviaAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Olivia/Olivia.tscn"
	},
	{
		"index": 7,
		"enemy_name": "Angry Pig",
		"description": "this is a Angry Pig",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/AngryPig/AngryPigAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/AngryPig/AngryPig.tscn"
	},
	{
		"index": 8,
		"enemy_name": "Watery",
		"description": "this is a Watery",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Watery/WateryAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Watery/Watery.tscn"
	},
	{
		"index": 9,
		"enemy_name": "Tharrin",
		"description": "this is a Tharrin",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Tharrin/TharrinAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Tharrin/Tharrin.tscn"
	},
	{
		"index": 10,
		"enemy_name": "Wispy",
		"description": "this is a Wispy",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Wispy/WispyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Wispy/Wispy.tscn"
	},
	{
		"index": 11,
		"enemy_name": "Crocodile",
		"description": "this is a Crocodile",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Crocodile/CrocodileAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Crocodile/Crocodile.tscn"
	},
	{
		"index": 12,
		"enemy_name": "Henry",
		"description": "this is a Henry",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Henry/HenryAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Henry/Henry.tscn"
	
	},
	{
		"index": 13,
		"enemy_name": "Gum Bot",
		"description": "this is a GumBot",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar":  "res://Game/Characters/Enemies/Summer/GumBot/GumBotAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/GumBot/GumBot.tscn"
	
	},
	{
		"index": 14,
		"enemy_name": "Mig",
		"description": "this is a Mig",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Summer/Mig/MigAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Mig/Mig.tscn"
	},
	{
		"index": 15,
		"enemy_name": "Duck",
		"description": "this is a Duck",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Duck/DuckAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Duck/Duck.tscn"
	},
	{
		"index": 16,
		"enemy_name": "Cucumber",
		"description": "this is a Cucumber",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Cucumber/CucumberAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Cucumber/Cucumber.tscn"
	},
	{
		"index": 17,
		"enemy_name": "Fierce Tooth",
		"description": "this is a FierceTooth",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/FierceTooth/FierceToothAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/FierceTooth/FierceTooth.tscn"
	},
	{
		"index": 18,
		"enemy_name": "Mage",
		"description": "this is a Mage",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Summer/Mage/MageAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Mage/Mage.tscn"
	},
	{
		"index": 19,
		"enemy_name": "Whale",
		"description": "this is a Whale",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Whale/WhaleAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Whale/Whale.tscn"
	},
	{
		"index": 20,
		"enemy_name": "Alien",
		"description": "this is a Alien",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Alien/AlienAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Alien/Alien.tscn"
		
	},
	{
		"index": 21,
		"enemy_name": "Turtle",
		"description": "this is a Turtle",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Summer/Turtle/TurtleAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Summer/Turtle/Turtle.tscn"
	}
]
var autumn_enemies = [
	{
		"index": 0,
		"enemy_name": "Fox",
		"description": "this is a Fox",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Autumn/Fox/FoxAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Fox/Fox.tscn"
	},
	{
		"index": 1,
		"enemy_name": "Oyster",
		"description": "this is a Oyster",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Autumn/Oyster/OysterAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Oyster/Oyster.tscn"
	},
	{
		"index": 2,
		"enemy_name": "Squirmy",
		"description": "this is a Squirmy",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Squirmy/SquirmyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Squirmy/Squirmy.tscn"
	},
	{
		"index": 3,
		"enemy_name": "Coco",
		"description": "this is a Coco",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Autumn/Coco/CocoAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Coco/Coco.tscn"
	},
	{
		"index": 4,
		"enemy_name": "Abelisaurus",
		"description": "this is a Abelisaurus",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Abelisaurus/AbelisaurusAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Abelisaurus/Abelisaurus.tscn"
	},
	{
		"index": 5,
		"enemy_name": "Leo",
		"description": "this is a Leo",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Leo/LeoAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Leo/Leo.tscn"
	},
	{
		"index": 6,
		"enemy_name": "Foggy",
		"description": "this is a Fog",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Autumn/Fog/FogAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Fog/Fog.tscn"
	},
	{
		"index": 7,
		"enemy_name": "Frosty",
		"description": "this is a Frosty",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Frosty/FrostyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Frosty/Frosty.tscn"
	},
	{
		"index": 8,
		"enemy_name": "Ghost",
		"description": "this is a Ghost",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Ghost/GhostAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Ghost/Ghost.tscn"
		
	},
	{
		"index": 9,
		"enemy_name": "King Pig",
		"description": "this is a KingPig",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Autumn/KingPig/KingPigAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/KingPig/KingPig.tscn"
	},
	{
		"index": 10,
		"enemy_name": "Evil Chest",
		"description": "this is a Evil Chest",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Autumn/EvilChest/EvilChestAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/EvilChest/EvilChest.tscn"
	},
	{
		"index": 11,
		"enemy_name": "Bearie",
		"description": "this is a Bearie",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Bearie/BearieAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Bearie/Bearie.tscn"
	
	},
	{
		"index": 12,
		"enemy_name": "Mosquito",
		"description": "this is a Mosquito",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Mosquito/MosquitoAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Mosquito/Mosquito.tscn"
	},
	{
		"index": 13,
		"enemy_name": "Ruby",
		"description": "this is a Ruby",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Ruby/RubyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Ruby/Ruby.tscn"
	},
	{
		"index": 14,
		"enemy_name": "Edie",
		"description": "this is a Edie",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Edie/EdieAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Edie/Edie.tscn"
	},
	{
		"index": 15,
		"enemy_name": "Baty",
		"description": "this is a bat",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Autumn/Bat/BatAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Bat/Bat.tscn"
	},
	{
		"index": 16,
		"enemy_name": "Orange",
		"description": "this is a Orange",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Orange/OrangeAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Orange/Orange.tscn" 
	},
	{
		"index": 17,
		"enemy_name": "Eye",
		"description": "this is a Eye",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Eye/EyeAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Eye/Eye.tscn"
	},
	{
		"index": 18,
		"enemy_name": "Orc",
		"description": "this is a Orc",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Orc/OrcAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Orc/Orc.tscn"
	},
	{
		"index": 19,
		"enemy_name": "Chameleon",
		"description": "this is a Chameleon",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Autumn/Chameleon/ChameleonAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Chameleon/Chameleon.tscn"
	},
	{
		"index": 20,
		"enemy_name": "Grizzly",
		"description": "this is a Grizzly",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Grizzly/GrizzlyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Grizzly/Grizzly.tscn"
	},
	{
		"index": 21,
		"enemy_name": "Trunk",
		"description": "this is a Trunk",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Trunk/TrunkAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Trunk/Trunk.tscn"
	},
	{
		"index": 22,
		"enemy_name": "Assassin",
		"description": "this is a Assassin",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Autumn/Assassin/AssassinAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Autumn/Assassin/Assassin.tscn"
	}
]
var winter_enemies = [
	{
		"index": 0,
		"enemy_name": "Reindeer",
		"description": "this is a Reindeer",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Reindeer/ReindeerAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Reindeer/Reindeer.tscn"
		
	},
	{
		"index": 1,
		"enemy_name": "Penguin",
		"description": "this is a Penguin",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Winter/Penguin/PenguinAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Penguin/Penguin.tscn"
		
	},
	{
		"index": 2,
		"enemy_name": "Chilly Willy",
		"description": "this is a ChillyWilly",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/ChillyWilly/ChillyWillyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/ChillyWilly/ChillyWilly.tscn"
		
	},
	{
		"index": 3,
		"enemy_name": "Blankey",
		"description": "this is a bat",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Winter/Blankey/BlankeyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Blankey/Blankey.tscn"
		
	},
	{
		"index": 4,
		"enemy_name": "Garcia",
		"description": "this is a Garcia",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Winter/Garcia/GarciaAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Garcia/Garcia.tscn"
	},
	{
		"index": 5,
		"enemy_name": "Enokitake",
		"description": "this is a Enokitake",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Enokitake/EnokitakeAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Enokitake/Enokitake.tscn"
	},
	{
		"index": 6,
		"enemy_name": "Snowman",
		"description": "this is a Snowman",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Snowman/SnowmanAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Snowman/Snowman.tscn"
	},
	{
		"index": 7,
		"enemy_name": "Scotty",
		"description": "this is a Scotty",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Winter/Scotty/ScottyAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Scotty/Scotty.tscn"

		
	},
	{
		"index": 8,
		"enemy_name": "Skeleton",
		"description": "this is a Skeleton",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Winter/Skeleton/SkeletonAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Skeleton/Skeleton.tscn"
	},
	{
		"index": 9,
		"enemy_name": "Rojo",
		"description": "this is a Rojo",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Rojo/RojoAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Rojo/Rojo.tscn"
	},
	{
		"index": 10,
		"enemy_name": "Rino",
		"description": "this is a Rino",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Winter/Rino/RinoAvatar.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Rino/Rino.tscn"
	},
	{
		"index": 11,
		"enemy_name": "Mimic",
		"description": "this is a Mimic",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Mimic/MimicAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Mimic/Mimic.tscn"
	},
	{
		"index": 12,
		"enemy_name": "Shadow",
		"description": "this is a Shadow",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Shadow/ShadowAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Shadow/Shadow.tscn"
	},
	{
		"index": 13,
		"enemy_name": "Pig",
		"description": "this is a Pig",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Pig/PigAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Pig/Pig.tscn"
	},
	{
		"index": 14,
		"enemy_name": "Mochi",
		"description": "this is a Mochi",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Mochi/MochiAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Mochi/Mochi.tscn"
	},
	{
		"index": 15,
		"enemy_name": "Blast",
		"description": "this is a Blast",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Blast/BlastAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Blast/Blast.tscn"
	},
	{
		"index": 16,
		"enemy_name": "Angry Ghost",
		"description": "this is a AngryGhost",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/AngryGhost/AngryGhostAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/AngryGhost/AngryGhost.tscn"
	},
	{
		"index": 17,
		"enemy_name": "Sapphire",
		"description": "this is a Sapphire",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Sapphire/SapphireAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Sapphire/Sapphire.tscn"
	},
	{
		"index": 18,
		"enemy_name": "Axie",
		"description": "this is a Axie",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Axie/AxieAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Axie/Axie.tscn"
	},
	{
		"index": 19,
		"enemy_name": "Umbra",
		"description": "this is a Umbra",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Umbra/UmbraAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Umbra/Umbra.tscn"
	},
	{
		"index": 20,
		"enemy_name": "Monarch",
		"description": "this is a Monarch",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Winter/Monarch/MonarchAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Monarch/Monarch.tscn"
	},
	{
		"index": 21,
		"enemy_name": "Big Mouth",
		"description": "this is a BigMouth",
		"unlock_at": 0,
		"lock_message": "unlock at score 10",
		"avatar": "res://Game/Characters/Enemies/Winter/BigMouth/BigMouthAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/BigMouth/BigMouth.tscn"
	},
	{
		"index": 21,
		"enemy_name": "Santa",
		"description": "this is a Santa",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Santa/SantaAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Santa/Santa.tscn"
	},
	{
		"index": 21,
		"enemy_name": "Pikachu",
		"description": "this is a Pikachu",
		"unlock_at": 0,
		"lock_message": "unlock at score 20",
		"avatar": "res://Game/Characters/Enemies/Winter/Pikachu/PikachuAvt.tscn",
		"sprite": "res://Game/Characters/Enemies/Winter/Pikachu/Pikachu.tscn"
	}
]

func get_enemies():
	var map_index = MapSettings.current_map_index
	match(map_index):
		0:
			return EnemySettings.spring_enemies
		1: 
			return EnemySettings.summer_enemies
		2: 
			return EnemySettings.autumn_enemies
		3: 
			return EnemySettings.winter_enemies
