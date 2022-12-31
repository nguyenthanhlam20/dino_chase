extends Enemy

class_name TurnBackEnemy

onready var animated_sprite = $AnimatedSprite
var velocity : Vector2
var position_x = GameSettings.right_position.x + 10
var position_y =  GameSettings.right_position.y - 80
var moving_style : int

enum STATE {RUN, TURN_BACK_RIGHT, TURN_BACK_LEFT, RUN_FASTER}
var current_state = STATE.RUN

enum MOVING_STYLE {RUN, RUN_FASTER, TURN_BACK_FASTER,
	TURN_BACK_NORMAL, GO_AWAY}

var count = 0

var current_moving_speed = moving_speed

func _ready():
	moving_style = Common.get_random_number(0, MOVING_STYLE.size() - 1)

func _physics_process(_delta):
	moving()

func moving():
	match(current_state):
		STATE.RUN:
			animated_sprite.set("flip_h", false)
			animated_sprite.play("run")
			velocity = Vector2(
				-moving_speed,
				min(velocity.y + gravity, GameSettings.terminal_gravity)
			)	
		STATE.RUN_FASTER:
			animated_sprite.set("flip_h", false)
			animated_sprite.play("run_fater")
			velocity = Vector2(
				-(moving_speed + 30),
				min(velocity.y + gravity, GameSettings.terminal_gravity)
			)	
		STATE.TURN_BACK_RIGHT:
			animated_sprite.set("flip_h", true)
			animated_sprite.play("run_fater")
			velocity = Vector2(
				moving_speed + 30,
				min(velocity.y + gravity, GameSettings.terminal_gravity)
			)	
		STATE.TURN_BACK_LEFT:
			animated_sprite.set("flip_h", false)
			animated_sprite.play("run_fater")
			velocity = Vector2(
				-(moving_speed + 50),
				min(velocity.y + gravity, GameSettings.terminal_gravity)
			)	
	
	if move_and_slide(velocity, Vector2.UP): 
		pass
		
func turn_back():
	count += 1
	if(count == 2):
		if(moving_style == MOVING_STYLE.TURN_BACK_FASTER):
			current_state = STATE.TURN_BACK_LEFT
		if(moving_style == MOVING_STYLE.TURN_BACK_NORMAL):
			current_state = STATE.RUN
		if(moving_style == MOVING_STYLE.GO_AWAY):
			current_state = STATE.TURN_BACK_RIGHT

func _on_HitBox_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.get_hit(1)


func _on_TurnBackArea_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	if(moving_style > MOVING_STYLE.RUN_FASTER && count != 2):
		current_state = STATE.TURN_BACK_RIGHT
	if(moving_style == MOVING_STYLE.RUN_FASTER):
		current_state = STATE.RUN_FASTER

func do_action():
	turn_back()
