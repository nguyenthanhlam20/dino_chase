extends Enemy

class_name FlashEnemy

onready var animated_sprite = $AnimatedSprite
var velocity : Vector2
var position_x = 300
var position_y = 120

enum STATE {RUN, RUN_FASTER}

var current_state = STATE.RUN

enum MOVING_STYLE {RUN, RUN_FASTER}
var moving_style = STATE.RUN

func _ready():
	moving_style = Common.get_random_number(0, MOVING_STYLE.size() - 1)


func _physics_process(_delta):
	match(current_state):
		STATE.RUN:
			animated_sprite.play("run")
			velocity = Vector2(
				velocity.x - float(moving_speed / 2) ,
				min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
			)
		STATE.RUN_FASTER:
			animated_sprite.play("run_fater")
			velocity = Vector2(
				velocity.x - (float(moving_speed / 2) * 5),
				min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
			)
			
	if move_and_slide(velocity, Vector2.UP): 
		pass



func _on_HitBox_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("body shape entered hit box of flying enemy", body_rid, body_shape_index, body_shape_index, local_shape_index)
	body.get_hit(1)



func _on_RunFasterZone_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body is Player && moving_style == MOVING_STYLE.RUN_FASTER):
		current_state = STATE.RUN_FASTER
