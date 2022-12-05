extends Node2D

var ememy_factory = []

func _ready():
	set_enemies(MapSettings.current_map_index)

func set_enemies(map_index):
	ememy_factory = []
	var original_enemies = []
	var sprite_path : String
	original_enemies = EnemySettings.get_enemies()
	
	for enemy in original_enemies:
		sprite_path = enemy.get("sprite")
		ememy_factory.append(load(sprite_path))
		
func get_enemies():
	return ememy_factory

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
