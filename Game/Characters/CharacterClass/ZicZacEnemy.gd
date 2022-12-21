extends Enemy

class_name ZicZacEnemy


onready var animation_player = $AnimationPlayer

var velocity : Vector2

var position_x = 320
var position_y = 115

enum STATE {RUN, GO_UP, GO_DOWN, GO_UP_HIGHEST}

var current_state = STATE.RUN

var custom_y : float

var run_count = 0

var moving_style : int

# moving_style:
# 0: normal run 
# 1: zic zac
# 2: fly up suddently


func _ready():
	moving_style = Common.get_random_number(0, 2)

func _physics_process(_delta):
	moving()

func moving():
	match(current_state):
		STATE.RUN:
			animation_player.play("run")
			velocity = Vector2(
				velocity.x - moving_speed,
				min(velocity.y + 20, GameSettings.terminal_gravity)
			)	
		STATE.GO_UP:
			animation_player.play("go_up")
			custom_y = -10
		STATE.GO_DOWN:
			animation_player.play("go_down")
			custom_y = 50
		STATE.GO_UP_HIGHEST:
			custom_y = -120
			animation_player.play("go_up_highest")
	
#	print("position ", velocity, custom_y)
	velocity = Vector2(
		velocity.x - moving_speed,
		custom_y
	)

	if move_and_slide(velocity, Vector2.UP): 
		pass
	
	
func _on_HitBox_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("body shape entered hit box of flying enemy", body_rid, body_shape_index, body_shape_index, local_shape_index)
	body.get_hit(1)

func run_animation_finished():
	if(moving_style > 1):
		run_count = run_count + 1
		if(run_count > 1):
			current_state = STATE.GO_DOWN
		if(run_count == 1):
			current_state = STATE.GO_UP

func go_up_animation_finished():
	current_state = STATE.RUN

func go_highest():
	if(moving_style == 1):
		current_state = STATE.GO_UP_HIGHEST
			
func go_down_animation_finished():
	if(run_count == 2):
		current_state = STATE.GO_UP
	
func go_up_highest_animation_finished():
	current_state = STATE.RUN

	
	
