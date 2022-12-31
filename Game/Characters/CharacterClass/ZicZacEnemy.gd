extends Enemy

class_name ZicZacEnemy


onready var animation_player = $AnimationPlayer

var velocity : Vector2

var position_x = GameSettings.right_position.x + 30
var position_y =  GameSettings.right_position.y - 65

enum STATE {RUN, GO_UP, GO_DOWN, GO_UP_HIGHEST}
var current_state = STATE.RUN

var custom_y : float
var run_count = 0

enum MOVING_STYLE {RUN, FLY_UP, ZIC_ZAC, ZIC_ZAC_UP}
var moving_style : int

func _ready():
	moving_style = Common.get_random_number(0, MOVING_STYLE.size() - 1)

func _physics_process(_delta):
	match(current_state):
		STATE.RUN:
			animation_player.play("run")
			velocity = Vector2(
				-moving_speed,
				min(velocity.y + 20, GameSettings.terminal_gravity)
			)	
		STATE.GO_UP:
			animation_player.play("go_up")
			custom_y = -10
		STATE.GO_DOWN:
			animation_player.play("go_down")
			custom_y = 50
		STATE.GO_UP_HIGHEST:
			custom_y = -70
			animation_player.play("go_up_highest")
			
	velocity = Vector2(-moving_speed, custom_y)

	if move_and_slide(velocity, Vector2.UP): 
		pass
		
func go_to_state(state_value) -> void:
	current_state = state_value
	print(state_value)
				
func do_action():
	if(moving_style >= MOVING_STYLE.ZIC_ZAC):
		go_to_state(STATE.GO_UP)

func _on_HitBox_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.get_hit(1)
	
func _on_DoActionZone_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	if(moving_style == MOVING_STYLE.ZIC_ZAC):
		go_to_state(STATE.GO_DOWN)
	if(moving_style == MOVING_STYLE.FLY_UP):
		go_to_state(STATE.GO_UP_HIGHEST)
