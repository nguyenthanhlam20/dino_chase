extends CenterContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var enemies = EnemySettings.get_enemies()
	
	if(self.get_child_count() > 1):
		self.remove_child(self.get_child(0))
	var index = GameSettings.random.randi_range(0, enemies.size() - 1)
	var em = load(enemies[index].get("avatar")).instance()
	em.set("position", Vector2(20, 15))
	em.set("scale", Vector2(1.5, 1.5))
	em.enable_playing(true)
	self.add_child(em)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
