extends Enemy

class_name RunningEnemy


var velocity : Vector2

func _physics_process(_delta):
	moving()

func moving():
	velocity = Vector2(
		velocity.x - moving_speed,
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)
	
	if move_and_slide(velocity, Vector2.UP): 
		pass
	
