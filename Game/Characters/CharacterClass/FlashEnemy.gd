extends Enemy

class_name FlashEnemy

onready var animated_sprite = $AnimatedSprite
var velocity : Vector2
var position_x = GameSettings.right_position.x + 10
var position_y = GameSettings.right_position.y - 60

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
				-moving_speed,
				min(velocity.y + gravity, GameSettings.terminal_gravity)
			)
		STATE.RUN_FASTER:
			animated_sprite.play("run_faster")
			velocity = Vector2(
				-(moving_speed + 50),
				min(velocity.y + gravity, GameSettings.terminal_gravity)
			)
			
	if move_and_slide(velocity, Vector2.UP): 
		pass



func _on_HitBox_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.get_hit(1)


func _on_RunFasterZone_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	if(moving_style == MOVING_STYLE.RUN_FASTER):
		current_state = STATE.RUN_FASTER
		
func do_action():
	pass
