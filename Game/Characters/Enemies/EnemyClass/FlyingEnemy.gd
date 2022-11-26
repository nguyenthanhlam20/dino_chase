extends Enemy

class_name FlyingEnemy


var velocity : Vector2

func _physics_process(_delta):
	moving()

func moving():
	velocity = Vector2(velocity.x - moving_speed, 0)
	if move_and_slide(velocity): 
		pass
	
