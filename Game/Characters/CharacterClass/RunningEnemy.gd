extends Enemy

class_name RunningEnemy

var velocity : Vector2

var position_x = GameSettings.right_position.x + 10
var position_y =  GameSettings.right_position.y - 80

func _physics_process(_delta):
	velocity = Vector2(
		-moving_speed,
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)
	
	if move_and_slide(velocity, Vector2.UP): 
		pass
	
func _on_HitBox_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.get_hit(1)
		
func do_action():
	pass
