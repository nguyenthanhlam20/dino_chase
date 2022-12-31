extends Enemy

class_name FatBird

var velocity : Vector2
onready var animation_player = $AnimationPlayer
onready var jump_zone = $JumpZone


var position_x = GameSettings.right_position.x + 10

var position_y = GameSettings.right_position.x - 60


enum STATE {RUN, JUMP, JUMP_HIGHER, FALL}

var current_state = STATE.FALL 

var moving_style : int

func _ready():
	moving_style = Common.get_random_number(0, 3)

	
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
		-moving_speed, 
		min(velocity.y + gravity, GameSettings.terminal_gravity)
	)

func jump_higher():
	animation_player.play("jump")
	current_state = STATE.FALL
	velocity = Vector2(
		-moving_speed,
		-jump_force
	)

func jump():
	animation_player.play("jump")
	current_state = STATE.FALL
	velocity = Vector2(
		-jump_speed, 
		-jump_force
	)
	
func fall():
	animation_player.play("fall")
	velocity = Vector2(
		-moving_speed,
		min(velocity.y + gravity, GameSettings.terminal_gravity)
	)
	if(is_on_floor()):
		current_state = STATE.RUN
		
func go_jump():
	if(moving_style > 1):
		current_state = STATE.JUMP

func jump_animation_finished():
	current_state = STATE.FALL
		
func go_jump_over():
	if(moving_style == 1 || moving_style == 3):
		current_state = STATE.JUMP_HIGHER
		
func _on_JumpZone_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	go_jump_over()
	jump_zone.queue_free()

func do_action():
	go_jump()
