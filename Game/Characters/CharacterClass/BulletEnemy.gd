extends Enemy

class_name BulletEnemy

onready var animation_player = $AnimationPlayer

var velocity : Vector2
var position_x = GameSettings.right_position.x + 10
var position_y = GameSettings.right_position.x + 30 - 70
var is_bomb = false

enum STATE {RUN, ATTACK}
var current_state = STATE.RUN 

enum MOVING_STYLE {RUN, TWO_ATTACK, ONE_ATTACK}
var moving_style : int

func _ready():
	moving_speed -= 30
	moving_style = Common.get_random_number(0, MOVING_STYLE.size() - 1)
	
func _physics_process(_delta):
	moving()
	
func moving():
	match(current_state):
		STATE.RUN:
			animation_player.play("run")
		STATE.ATTACK:
			animation_player.play("attack")
	run()	
	if move_and_slide(velocity, Vector2.UP): 
		pass
		

func run():
	velocity = Vector2(
		-moving_speed, 
		min(velocity.y + gravity, GameSettings.terminal_gravity)
	)


func go_run():
	current_state = STATE.RUN

			
func go_attack():
	if(moving_style == MOVING_STYLE.TWO_ATTACK):
		current_state = STATE.ATTACK

func do_action():
	go_attack()
