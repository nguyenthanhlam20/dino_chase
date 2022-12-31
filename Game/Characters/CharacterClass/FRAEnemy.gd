extends Enemy

class_name FRAEnemy


onready var animation_player = $AnimationPlayer
onready var do_action_zone = $DoActionZone

var velocity : Vector2

var position_x = GameSettings.right_position.x + 10
var position_y =  GameSettings.right_position.y - 65

enum STATE {RUN, FLY_UP, FLY_DOWN, FLY_UP_HIGHEST, ATTACK}
var current_state = STATE.RUN

var custom_y : float
var run_count = 0

enum MOVING_STYLE {RUN, ONE_FLY_FAR, ONE_FLY_NEAR, TWO_FLY,
	ONE_ATTACK_NEAR, ONE_ATTACK_FAR, TWO_ATTACK, FLY_FAR_ATTACK_NEAR,
	FLY_NEAR_ATTACK_FAR}
var moving_style : int

func _ready():
	moving_style = Common.get_random_number(0, MOVING_STYLE.size() - 1)
	moving_style = MOVING_STYLE.TWO_FLY

func _physics_process(_delta):
	match(current_state):
		STATE.RUN:
			animation_player.play("run")
			velocity = Vector2(
				-moving_speed,
				min(velocity.y + 20, GameSettings.terminal_gravity)
			)	
		STATE.FLY_UP:
			animation_player.play("fly_up")
			custom_y = -20
		STATE.FLY_DOWN:
			animation_player.play("fly_down")
			custom_y = 20
		STATE.FLY_UP_HIGHEST:
			custom_y = -75
			animation_player.play("fly_up")
		STATE.ATTACK:
			animation_player.play("attack" )
			velocity = Vector2(
				-moving_speed,
				min(velocity.y + 20, GameSettings.terminal_gravity)
			)	
			
	velocity = Vector2(-moving_speed, custom_y)

	if move_and_slide(velocity, Vector2.UP): 
		pass
		
func go_to_state(state_value) -> void:
	current_state = state_value
				
func _on_HitBox_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.get_hit(1)
func fly_up_animation_finished():
	current_state = STATE.FLY_DOWN	
func attack_animation_finished():
	current_state = STATE.RUN
	
func go_attack():
	current_state = STATE.ATTACK
		
func do_action():
	if(moving_style == MOVING_STYLE.FLY_NEAR_ATTACK_FAR 
	|| moving_style == MOVING_STYLE.TWO_ATTACK
	|| moving_style == MOVING_STYLE.ONE_ATTACK_FAR):
		go_to_state(STATE.ATTACK)
	if(moving_style == MOVING_STYLE.FLY_FAR_ATTACK_NEAR
	|| moving_style == MOVING_STYLE.TWO_FLY
	|| moving_style == MOVING_STYLE.ONE_FLY_FAR):
		go_to_state(STATE.FLY_UP)


func _on_DoActionZone_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	if(moving_style == MOVING_STYLE.FLY_FAR_ATTACK_NEAR 
	|| moving_style == MOVING_STYLE.ONE_ATTACK_NEAR
	|| moving_style == MOVING_STYLE.TWO_ATTACK):
		go_to_state(STATE.ATTACK)
	if(moving_style == MOVING_STYLE.FLY_NEAR_ATTACK_FAR 
	|| moving_style == MOVING_STYLE.ONE_FLY_NEAR
	|| moving_style == MOVING_STYLE.TWO_FLY):
		go_to_state(STATE.FLY_UP_HIGHEST)
		do_action_zone.queue_free()
