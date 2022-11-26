extends JumpingEnemy

onready var animation_player = $AnimationPlayer

func _physics_process(_delta):
	match(current_state):
		STATE.JUMP:
			animation_player.play("jump")
		STATE.FALL:
			animation_player.play("fall")
		STATE.RUN:
			animation_player.play("run")

func running_fininshed():
	current_state = STATE.JUMP


func _on_HitBox_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("body shape entered hit box of flying enemy", body_rid, body_shape_index, body_shape_index, local_shape_index)
	body.get_hit(1)
