extends Enemy

var bullet_speed = 2

var velocity : Vector2

func _physics_process(delta):
	velocity = Vector2(
		velocity.x - bullet_speed,
		0
	)
	if(move_and_slide(velocity)):
		pass

func _on_HitBox_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	body.get_hit(1)
