extends Enemy

class_name Radish_Enemy

onready var animated_sprite = $AnimatedSprite
var velocity : Vector2
var position_x = 200
var position_y = 105  
var current_position_y : float

enum STATE {FLY, FLY_UPWARD, RUN}
var current_state = STATE.FLY

enum MOVING_STYLE {FLY, RUN, FLY_UPWARD}
var moving_style : int
func _ready():
	moving_style = Common.get_random_number(0, MOVING_STYLE.size() - 1)

func _physics_process(_delta):
	moving()

func moving():
	match(current_state):
		STATE.FLY:
			current_position_y = 0
			animated_sprite.play("fly")
		STATE.FLY_UPWARD: 
			animated_sprite.play("fly")
			current_position_y = -20
		STATE.RUN:
			animated_sprite.play("run")
			current_position_y = min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
			
	velocity = Vector2(
		-moving_speed,
		current_position_y
	)
	
	if move_and_slide(velocity, Vector2.UP): 
		pass
	

func go_to_run_state():
	if(moving_style == MOVING_STYLE.RUN):
		current_state = STATE.RUN	
	if(moving_style == MOVING_STYLE.FLY_UPWARD):
		current_state = STATE.FLY_UPWARD 
	
func _on_HitBox_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.get_hit(1)

func _on_RunZone_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	go_to_run_state()
