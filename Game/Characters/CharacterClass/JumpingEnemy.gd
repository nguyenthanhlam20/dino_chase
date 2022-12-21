extends Enemy

class_name JumpingEnemy

onready var animation_player = $AnimationPlayer
onready var jump_zone = $JumpZone
export(int) var jump_force = 350

var velocity : Vector2
var position_x = 280
var position_y = 110

enum STATE {RUN, JUMP, JUMP_HIGHER, FALL}
var current_state = STATE.RUN 

enum MOVING_STYLE {RUN, ONE_JUMP_FAR, ONE_JUMP_NEAR, TWO_JUMP}
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
	if move_and_slide(velocity, Vector2.UP): 
		pass

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
		
func go_jump_over():
	if(moving_style == MOVING_STYLE.ONE_JUMP_NEAR 
		|| moving_style == MOVING_STYLE.TWO_JUMP):
		current_state = STATE.JUMP_HIGHER
		
func _on_JumpZone_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body is Player):
		go_jump_over()
		jump_zone.queue_free()
