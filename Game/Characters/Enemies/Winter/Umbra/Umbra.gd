extends Enemy

class_name Umbra

onready var animation_player = $AnimationPlayer
onready var action_zone = $DoActionZone

var velocity : Vector2

var position_x = 340
var position_y = 103

enum STATE {RUN, FLY, FLY_START,FLY_START_HIGH, FLY_END, ATTACK}
var current_state = STATE.RUN

enum MOVING_STYLE {RUN, ONE_ATTACK_FAR, 
	FLY_NEAR_ATTACK_FAR, TWO_ATTACK, ONE_ATTACK_NEAR,
	ONE_FLY_NEAR, ONE_FLY_FAR, TWO_FLY,
	FLY_FAR_ATTACK_NEAR, FLY, FLY_RUN_ATTACK, FLY_RUN, 
	FLY_RUN_FLY}
var moving_style = MOVING_STYLE.RUN

func _ready():
	moving_style = Common.get_random_number(0, MOVING_STYLE.size() - 1)
	if(moving_style >= MOVING_STYLE.FLY 
	&& moving_style <= MOVING_STYLE.FLY_RUN_FLY):
		current_state = STATE.FLY

func _physics_process(_delta):
	match(current_state):
		STATE.RUN:
			animation_player.play("run")
			moving(-moving_speed, min(velocity.y + gravity, GameSettings.terminal_gravity))
		STATE.FLY:
			animation_player.play("fly")
			moving(-moving_speed, 0)
		STATE.FLY_START:
			animation_player.play("fly_start")
			moving(-moving_speed, -20)
		STATE.FLY_START_HIGH:
			animation_player.play("fly_start")
			moving(-moving_speed, -70)
		STATE.FLY_END:
			animation_player.play("fly_end")
			moving(-moving_speed, min(velocity.y + 5, GameSettings.terminal_gravity))
			if(is_on_floor()):
				current_state = STATE.RUN
		STATE.ATTACK:
			animation_player.play("attack")
			moving(-moving_speed, min(velocity.y + gravity, GameSettings.terminal_gravity))
		


	if move_and_slide(velocity): 
		pass
		
func moving(x_value, y_value) -> void:
	velocity = Vector2(x_value, y_value)

func attack_animation_finished() -> void:
	current_state = STATE.RUN	
func fly_start_animation_finished() -> void:
	current_state = STATE.FLY
func fly_animation_finished() -> void:
	if(moving_style < MOVING_STYLE.FLY):
		current_state = STATE.FLY_END
func fly_end_animation_finished() -> void:
		current_state = STATE.RUN
	
func go_to_state(state_value) -> void: 
	current_state = state_value
	
func _on_HitBox_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.get_hit(1)
	
	
func do_action():
	if(moving_style >= MOVING_STYLE.ONE_ATTACK_FAR
	&& moving_style <= MOVING_STYLE.TWO_ATTACK):
		go_to_state(STATE.ATTACK)
	if(moving_style == MOVING_STYLE.FLY_FAR_ATTACK_NEAR
	|| moving_style == MOVING_STYLE.TWO_FLY
	|| moving_style == MOVING_STYLE.ONE_FLY_FAR):
		go_to_state(STATE.FLY_START)
	if(moving_style == MOVING_STYLE.FLY_RUN_ATTACK
	|| moving_style == MOVING_STYLE.FLY_RUN_FLY):
		go_to_state(STATE.FLY_END)

func _on_DoActionZone_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	if(moving_style == MOVING_STYLE.ONE_ATTACK_NEAR
	|| moving_style == MOVING_STYLE.FLY_FAR_ATTACK_NEAR
	|| moving_style == MOVING_STYLE.TWO_ATTACK
	|| moving_style == MOVING_STYLE.FLY_RUN_ATTACK):
		go_to_state(STATE.ATTACK)
	if(moving_style == MOVING_STYLE.ONE_FLY_NEAR
	|| moving_style == MOVING_STYLE.TWO_FLY
	|| moving_style == MOVING_STYLE.FLY_NEAR_ATTACK_FAR
	|| moving_style == MOVING_STYLE.FLY_RUN_FLY):
		go_to_state(STATE.FLY_START_HIGH)
		
	if(moving_style == MOVING_STYLE.FLY_RUN):
		go_to_state(STATE.FLY_END)
	action_zone.queue_free()
