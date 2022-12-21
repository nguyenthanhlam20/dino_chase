extends Enemy

class_name RunningEnemy

var velocity : Vector2

var position_x = 300
var position_y = 120

func _physics_process(_delta):
	moving()

func moving():
	velocity = Vector2(
		velocity.x - moving_speed,
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)
	
	if move_and_slide(velocity, Vector2.UP): 
		pass
	
	
func _on_HitBox_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("body shape entered hit box of flying enemy", body_rid, body_shape_index, body_shape_index, local_shape_index)
	if(body is Player):
		body.get_hit(1)

