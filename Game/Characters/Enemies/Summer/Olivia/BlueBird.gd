extends FlyingEnemy


func _on_HitBox_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("body shape entered hit box of flying enemy", body_rid, body_shape_index, body_shape_index, local_shape_index)
	body.get_hit(1)
