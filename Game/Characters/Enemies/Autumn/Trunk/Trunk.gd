extends Enemy

class_name Trunk
onready var bullet = load("res://Game/Characters/Enemies/Autumn/Trunk/TrunkBullet.tscn")
onready var animation_player = $AnimationPlayer

var velocity : Vector2
var position_x = GameSettings.right_position.x + 10
var position_y = GameSettings.right_position.y - 70
var is_bomb = false

enum STATE {RUN, ATTACK}
var current_state = STATE.RUN 

enum MOVING_STYLE {RUN, ONE_ATTACK_NEAR, TWO_ATTACK, ONE_ATTACK_FAR}
var moving_style : int

func _ready():
	moving_style = Common.get_random_number(0, MOVING_STYLE.size() - 1)
	moving_style = MOVING_STYLE.TWO_ATTACK
	
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
		-bullet_enemy_speed, 
		min(velocity.y + gravity, GameSettings.terminal_gravity)
	)


func go_run():
	current_state = STATE.RUN
	
func go_attack():
	current_state = STATE.ATTACK
		

func do_action():
	if(moving_style >= MOVING_STYLE.TWO_ATTACK):
		go_attack()

func attack_animation_finished():
	var bullet_ins = bullet.instance()
	bullet_ins.position = Vector2(-5, 2)
	self.add_child(bullet_ins)
	current_state = STATE.RUN
	
func _on_AttackZone_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	if(moving_style == MOVING_STYLE.ONE_ATTACK_NEAR 
	|| moving_style == MOVING_STYLE.TWO_ATTACK):
		go_attack()
