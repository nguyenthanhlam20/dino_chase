extends ParallaxBackground

export(int) var scroll_speed : int = 40

export(float) var rotation_speed: float = 0.1
var direction = Vector2(0, 1)

var start = false

func _process(delta):
	if(start):
		self.scroll_offset += direction * scroll_speed * delta
		direction = direction.rotated(rotation_speed * delta)	

func start_moving(value):
	start = value
	if(!value):
		self.scroll_offset = Vector2(0, 0)
