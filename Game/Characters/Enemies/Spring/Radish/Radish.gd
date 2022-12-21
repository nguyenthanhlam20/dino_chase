extends Enemy

class_name Radish_Enemy

onready var animated_sprite = $AnimatedSprite
var velocity : Vector2
var position_x = 200
var position_y = 105  
var current_position_y : float
var moving_style : int

var current_state = STATE.FLY
enum STATE {FLY, FLY_UPWARD, RUN}

func _ready():
	moving_style = Common.get_random_number(0, 2)

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
		velocity.x - moving_speed,
		current_position_y
	)
	
	if move_and_slide(velocity, Vector2.UP): 
		pass
	

func go_to_run_state():
	if(moving_style == 1):
		current_state = STATE.RUN	
	if(moving_style == 2):
		current_state = STATE.FLY_UPWARD 
	
func _on_HitBox_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("body shape entered hit box of flying enemy", body_rid, body_shape_index, body_shape_index, local_shape_index)
	body.get_hit(1)

