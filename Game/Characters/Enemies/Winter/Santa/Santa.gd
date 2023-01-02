extends Enemy

class_name Santa

onready var animation_player = $AnimationPlayer
onready var do_action_zone = $DoActionZone


var velocity : Vector2
var position_x = GameSettings.right_position.x + 10
var position_y =  GameSettings.right_position.y - 70
enum ATTACK_STYLE {ONE, TWO, THREE}
var attack_style : int
enum STATE {RUN, JUMP, JUMP_HIGHER, ATTACK, FALL}
var current_state = STATE.RUN 

enum MOVING_STYLE {RUN, ONE_JUMP_FAR, ONE_JUMP_NEAR, TWO_JUMP,
	ONE_ATTACK_NEAR, ONE_ATTACK_FAR, TWO_ATTACK, JUMP_FAR_ATTACK_NEAR,
	JUMP_NEAR_ATTACK_FAR}
var moving_style : int

func _ready():
	moving_style = Common.get_random_number(0, MOVING_STYLE.size() - 1)

	
	
func _physics_process(_delta):
	moving()
	
func moving():
	match(current_state):
		STATE.JUMP:
			jump()
		STATE.JUMP_HIGHER:
			jump_higher()
		STATE.FALL:
			fall()
		STATE.RUN:
			run()
		STATE.ATTACK:
			attack()
	if move_and_slide(velocity, Vector2.UP): 
		pass
		
func attack():

	match(attack_style):
		ATTACK_STYLE.ONE:
			animation_player.play("attack_one")
		ATTACK_STYLE.TWO:
			animation_player.play("attack_two")
		ATTACK_STYLE.THREE:
			animation_player.play("attack_three")
	
	velocity = Vector2(
		-moving_speed, 
		min(velocity.y + gravity, GameSettings.terminal_gravity)
	)

func run():
	animation_player.play("run")
	velocity = Vector2(
		-moving_speed, 
		min(velocity.y + gravity, GameSettings.terminal_gravity)
	)

func jump_higher():
	animation_player.play("jump")
	current_state = STATE.FALL
	velocity = Vector2(-jump_speed, -(jump_force + 50))

func jump():
	animation_player.play("jump")
	current_state = STATE.FALL
	velocity = Vector2(-jump_speed_far, -jump_force)
	
func fall():
	animation_player.play("fall")
	velocity = Vector2(
		-jump_speed,
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)
	if(is_on_floor()):
		current_state = STATE.RUN
		
func go_jump():
	if(moving_style > MOVING_STYLE.RUN):
		current_state = STATE.JUMP

func attack_animation_finished():
	current_state = STATE.RUN
				
func go_jump_over():
	current_state = STATE.JUMP_HIGHER
		
func go_attack():
	attack_style = Common.get_random_number(0, ATTACK_STYLE.size() - 1)
	current_state = STATE.ATTACK
		
func do_action():
	if(moving_style == MOVING_STYLE.JUMP_NEAR_ATTACK_FAR 
	|| moving_style == MOVING_STYLE.TWO_ATTACK
	|| moving_style == MOVING_STYLE.ONE_ATTACK_FAR):
		go_attack()
	if(moving_style == MOVING_STYLE.JUMP_FAR_ATTACK_NEAR
	|| moving_style == MOVING_STYLE.TWO_JUMP
	|| moving_style == MOVING_STYLE.ONE_JUMP_FAR):
		go_jump()


func _on_DoActionZone_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	if(moving_style == MOVING_STYLE.JUMP_FAR_ATTACK_NEAR 
	|| moving_style == MOVING_STYLE.ONE_ATTACK_NEAR
	|| moving_style == MOVING_STYLE.TWO_ATTACK):
		go_attack()
	if(moving_style == MOVING_STYLE.JUMP_NEAR_ATTACK_FAR 
	|| moving_style == MOVING_STYLE.ONE_JUMP_NEAR
	|| moving_style == MOVING_STYLE.TWO_JUMP):
		go_jump_over()
		do_action_zone.queue_free()


func _on_HitBox_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.get_hit(1)
