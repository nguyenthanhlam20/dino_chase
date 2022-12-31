extends Enemy

class_name Flying_Enemy

var velocity : Vector2

var position_x = GameSettings.right_position.x + 10
var position_y = GameSettings.right_position.y - 75

func _physics_process(_delta):
	velocity = Vector2(-moving_speed, 0)
	if move_and_slide(velocity): 
		pass
	
func _on_HitBox_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.get_hit(1)
	
	
func do_action():
	pass
