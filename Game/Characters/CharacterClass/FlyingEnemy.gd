extends Enemy

class_name Flying_Enemy

var velocity : Vector2

var position_x = 200
var position_y = 50


func _physics_process(_delta):
	moving()

func moving():
	velocity = Vector2(velocity.x - moving_speed, 0)
	if move_and_slide(velocity): 
		pass
	
func _on_HitBox_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("body shape entered hit box of flying enemy", body_rid, body_shape_index, body_shape_index, local_shape_index)
	body.get_hit(1)
	
	

