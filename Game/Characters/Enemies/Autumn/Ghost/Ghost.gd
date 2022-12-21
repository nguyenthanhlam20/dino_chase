extends Enemy

class_name Ghost

onready var animation_player = $AnimationPlayer

var velocity : Vector2
var position_x = 280
var position_y = 120
var custom_y : float
var run_count = 0

enum STATE {IDLE, RUN, DISAPPEAR, APPEAR}
var current_state = STATE.RUN

enum MOVING_STYLE {RUN, DISAPPEAR, DIE}
var moving_style : int

func _ready():
	moving_style = Common.get_random_number(0, MOVING_STYLE.size() - 1)
#	moving_style = MOVING_STYLE.DIE

func _physics_process(_delta):
	moving()

func moving():
	match(current_state):
		STATE.RUN:
			animation_player.play("run")
		STATE.DISAPPEAR:
			animation_player.play("disappear")
		STATE.APPEAR:
			animation_player.play("appear")
		STATE.IDLE:
			animation_player.play("idle")
	velocity = Vector2(
		velocity.x - moving_speed,
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)

	if move_and_slide(velocity, Vector2.UP): 
		pass
	
	
func _on_HitBox_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("body shape entered hit box of flying enemy", body_rid, body_shape_index, body_shape_index, local_shape_index)
	body.get_hit(1)
	
func go_appear():
	current_state = STATE.APPEAR

func go_disappear():
	current_state = STATE.DISAPPEAR

func appear_animation_finished():
	if(moving_style == MOVING_STYLE.DIE):
		self.queue_free()
	else:
		current_state = STATE.RUN



func disappear_animation_finished():
	current_state = STATE.IDLE

func _on_AppearZone_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body is Player && moving_style > MOVING_STYLE.RUN):
		go_appear()

func _on_DisappearZone_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body is Player && moving_style == MOVING_STYLE.DISAPPEAR):
		go_disappear()
			
		
