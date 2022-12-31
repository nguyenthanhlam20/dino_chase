extends Enemy

class_name Orange

onready var animation_player = $AnimationPlayer

var velocity : Vector2
var position_x = 280
var position_y = 120
var custom_y : float
var run_count = 0

enum STATE {RUN, ROLLING, ROLL_START, ROLL_STOP}
var current_state = STATE.RUN

enum MOVING_STYLE {RUN, RUN_ROLLING, RUN_ROLLING_RUN,
	ROLLING, ROLLING_RUN, ROLLING_RUN_ROLLING}
var moving_style : int

func _ready():
	moving_style = Common.get_random_number(0, MOVING_STYLE.size() - 1)
	if(moving_style > MOVING_STYLE.RUN_ROLLING_RUN):
		current_state = STATE.ROLLING

func _physics_process(_delta):
	moving()

func moving():
	match(current_state):
		STATE.RUN:
			animation_player.play("run")
		STATE.ROLLING:
			animation_player.play("rolling")
		STATE.ROLL_START:
			animation_player.play("roll_start")
		STATE.ROLL_STOP:
			animation_player.play("roll_stop")
	velocity = Vector2(
		velocity.x - moving_speed,
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)

	if move_and_slide(velocity, Vector2.UP): 
		pass
	
	
func _on_HitBox_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("body shape entered hit box of flying enemy", body_rid, body_shape_index, body_shape_index, local_shape_index)
	body.get_hit(1)
	
func go_roll_start():
	current_state = STATE.ROLL_START

func go_roll_stop():
	current_state = STATE.ROLL_STOP

func roll_start_animation_finished():
	current_state = STATE.ROLLING

func roll_stop_animation_finished():
	current_state = STATE.RUN

func _on_RollStartArea_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
		if(moving_style == MOVING_STYLE.RUN_ROLLING_RUN):
			go_roll_start()
		if(moving_style == MOVING_STYLE.ROLLING_RUN_ROLLING):
			go_roll_stop()

func _on_RollStopArea_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	if(moving_style == MOVING_STYLE.RUN_ROLLING_RUN 
		|| moving_style == MOVING_STYLE.ROLLING_RUN):
		go_roll_stop()
	if(moving_style == MOVING_STYLE.RUN_ROLLING
		|| moving_style == MOVING_STYLE.ROLLING_RUN_ROLLING):
		go_roll_start()
