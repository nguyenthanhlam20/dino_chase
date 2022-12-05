extends Enemy

class_name JumpingEnemy

var velocity : Vector2
export(int) var jump_force = 550

enum STATE {RUN, JUMP, FALL}

var current_state = STATE.RUN setget set_state, get_state

func set_state(value):
	current_state = value
	
func get_state():
	return current_state
	
func _physics_process(_delta):
	moving()
	
func moving():
	match(current_state):
		STATE.JUMP:
			jump()
		STATE.FALL:
			fall()
		STATE.RUN:
			run()
	if move_and_slide(velocity, Vector2.UP): 
		pass

func run():
	velocity = Vector2(
		velocity.x - moving_speed, 
		0
	)

func jump():
	current_state = STATE.FALL
	velocity = Vector2(
		velocity.x - 10, 
		-jump_force
	)
	
func fall():
	velocity = Vector2(
		velocity.x - 1,
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)
	if(is_on_floor()):
		current_state = STATE.RUN
