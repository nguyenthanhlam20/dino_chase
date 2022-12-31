extends Enemy

class_name SwordEnemy

onready var animation_player = $AnimationPlayer

var velocity : Vector2
var position_x = GameSettings.right_position.x + 10
var position_y =  GameSettings.right_position.y - 80
var custom_y : float
var run_count = 0

enum STATE {RUN, ATTACK}
var current_state = STATE.RUN

enum MOVING_STYLE {ATTACK, RUN_THROUGH, TWO_ATTACK}
var moving_style : int

func _ready():
	moving_style = Common.get_random_number(0, MOVING_STYLE.size() - 1)


func _physics_process(_delta):
	match(current_state):
		STATE.RUN:
			animation_player.play("run")
		STATE.ATTACK:
			animation_player.play("attack")
	
	velocity = Vector2(
		-moving_speed,
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)

	if move_and_slide(velocity, Vector2.UP): 
		pass
	
func _on_HitBox_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.get_hit(1)
	
func go_attack():
	current_state = STATE.ATTACK

func attack_animation_finished():
	current_state = STATE.RUN

func _on_AttackZone_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	if(moving_style == MOVING_STYLE.ATTACK):
		go_attack()
		
func do_action():
	if(moving_style == MOVING_STYLE.TWO_ATTACK):
		go_attack()

