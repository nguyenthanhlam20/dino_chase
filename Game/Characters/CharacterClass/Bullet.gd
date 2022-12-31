extends Enemy

var velocity : Vector2

func _physics_process(_delta):
	velocity = Vector2(-bullet_speed, 0)
	if(move_and_slide(velocity)):
		pass

func _on_HitBox_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.get_hit(1)
