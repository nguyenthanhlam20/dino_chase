extends Node2D

var ememy_factory = []
var unlock_enemies : Array
#var season_enemies

#func get_season_enemies(): 
#	return season_enemies
#
#func set_season_enemies() -> void:
#	match(MapSettings.current_map):
#		MapSettings.MAP.SPRING:
#			season_enemies = load(Constants.SPRING_ENEMIES)
#		MapSettings.MAP.SUMMER:
#			season_enemies = load(Constants.SUMMER_ENEMIES)
#		MapSettings.MAP.AUTUMN: 
#			season_enemies = load(Constants.AUTUMN_ENEMIES)
#		MapSettings.MAP.WINTER: 
#			season_enemies = load(Constants.WINTER_ENEMIES)


func set_enemies():
	unlock_enemies = User.get_unlock_enemies(MapSettings.get_map_info("map_name").to_lower())
	print("unlock: ", unlock_enemies)
	ememy_factory = []
	for enemy in EnemySettings.get_enemies():
		if(enemy.get("index") in unlock_enemies):
			ememy_factory.append(load(enemy.get("sprite")))
			
func get_enemies():
	set_enemies()
	return ememy_factory

