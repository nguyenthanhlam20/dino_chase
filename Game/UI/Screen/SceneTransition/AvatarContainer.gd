extends CenterContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var enemies = EnemySettings.get_enemies()
	var unlock_enemies = User.get_unlock_enemies(MapSettings.get_map_info("map_name").to_lower())
	var index = Common.get_random_number(0, unlock_enemies.size() - 1)
	var em = load(enemies[index].get("avatar")).instance()
	em.set("position", Vector2(20, 15))
	em.set("scale", Vector2(1.5, 1.5))
	em.set_is_unlock(true)
	em.enable_playing(true)
	self.add_child(em)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
