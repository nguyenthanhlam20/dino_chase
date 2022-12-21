extends Enemy

class_name JRAEnemy

onready var animation_player = $AnimationPlayer
onready var do_action_zone = $DoActionZone
export(int) var jump_force = 350


var velocity : Vector2
var position_x = 310
var position_y = 110

enum STATE {RUN, JUMP, JUMP_HIGHER, PRE_ATTACK, POST_ATTACK, ATTACK, FALL}
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
		STATE.PRE_ATTACK:
			pre_attack()
		STATE.POST_ATTACK:
			post_attack()
		STATE.ATTACK:
			attack()
	if move_and_slide(velocity, Vector2.UP): 
		pass
		
func post_attack():
	animation_player.play("post_attack")
	velocity = Vector2(
		velocity.x - moving_speed, 
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)
func pre_attack():
	animation_player.play("pre_attack")
	velocity = Vector2(
		velocity.x - moving_speed, 
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)
func attack():
	animation_player.play("attack")
	velocity = Vector2(
		velocity.x - moving_speed, 
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)

func run():
	animation_player.play("run")
	velocity = Vector2(
		velocity.x- moving_speed, 
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)

func jump_higher():
	animation_player.play("jump")
	current_state = STATE.FALL
	velocity = Vector2(
		velocity.x - moving_speed,
		-(jump_force - 30)
	)

func jump():
	animation_player.play("jump")
	current_state = STATE.FALL
	velocity = Vector2(
		velocity.x - moving_speed, 
		-jump_force
	)
	
func fall():
	animation_player.play("fall")
	velocity = Vector2(
		velocity.x - moving_speed,
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)
	if(is_on_floor()):
		current_state = STATE.RUN
		
func go_jump():
	if(moving_style > MOVING_STYLE.RUN):
		current_state = STATE.JUMP

func jump_animation_finished():
	current_state = STATE.FALL

func pre_attack_animation_finished():
	current_state = STATE.ATTACK

func post_attack_animation_finished():
	current_state = STATE.RUN

func attack_animation_finished():
	current_state = STATE.POST_ATTACK
				
func go_jump_over():
	if(moving_style == MOVING_STYLE.ONE_JUMP_NEAR 
		|| moving_style == MOVING_STYLE.TWO_JUMP
		|| moving_style == MOVING_STYLE.JUMP_NEAR_ATTACK_FAR):
		current_state = STATE.JUMP_HIGHER
		
func go_attack():
	current_state = STATE.ATTACK
		
func do_action():
	if(moving_style == MOVING_STYLE.JUMP_NEAR_ATTACK_FAR 
		|| moving_style == MOVING_STYLE.TWO_ATTACK):
		go_attack()
	if(moving_style == MOVING_STYLE.JUMP_FAR_ATTACK_NEAR ||
		moving_style == MOVING_STYLE.TWO_JUMP):
		go_jump()


func _on_DoActionZone_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body is Player):
		if(moving_style == MOVING_STYLE.JUMP_FAR_ATTACK_NEAR 
		|| moving_style == MOVING_STYLE.ONE_ATTACK_NEAR
		|| moving_style == MOVING_STYLE.TWO_ATTACK):
			go_attack()
		else:
			go_jump_over()
		do_action_zone.queue_free()
