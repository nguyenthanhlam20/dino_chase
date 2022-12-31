extends Node2D

var ememy_factory = []

func set_enemies():
#	var unlock_enemies = User.data.completion.enemy.get(MapSettings.get_current_map_name())
#	ememy_factory = []
#	var original_enemies = []
#	var sprite_path : String
#
#	original_enemies = EnemySettings.get_enemies()
#	for enemy in original_enemies:
#		sprite_path = enemy.get("sprite")
#		ememy_factory.append(sprite_path)
#		if(enemy.get("index") in unlock_enemies):
	pass
			
		
func get_enemies():
	set_enemies()
	return ememy_factory

