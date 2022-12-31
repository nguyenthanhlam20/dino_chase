extends Enemy

class_name Pig

onready var animation_player = $AnimationPlayer
onready var do_action_zone = $DoActionZone

var velocity : Vector2
var position_x = 310
var position_y = 110
var is_bomb = false
onready var bomb = "res://Game/Characters/Enemies/Autumn/Pig/Item/Bomb.tscn"
onready var box = "res://Game/Characters/Enemies/Autumn/Pig/Item/Box.tscn"

enum STATE {RUN, BOM_RUN, BOX_RUN, ATTACK, FALL, JUMP, BOX_THROW, BOM_TRROW}
var current_state = STATE.RUN 

enum MOVING_STYLE {RUN, THROW_BOM_ATTACK, THROW_BOM_JUMP, 
	THROW_BOM_RUN, BOM_RUN, THROW_BOX_ATTACK, THROW_BOX_JUMP, THROW_BOX_RUN,
	BOX_RUN, TWO_JUMP, TWO_ATTACK, JUMP_FAR_ATTACK_NEAR, JUMP_NEAR_ATTACK_FAR,
	ONE_JUMP_FAR, ONE_JUMP_NEAR, ONE_ATTACK_FAR, ONE_ATTACK_NEAR}
var moving_style : int

func _ready():
	moving_style = Common.get_random_number(0, MOVING_STYLE.size() - 1)
	moving_style = MOVING_STYLE.THROW_BOX_RUN
	
	if(moving_style >= MOVING_STYLE.THROW_BOM_ATTACK 
		&& moving_style <= MOVING_STYLE.BOM_RUN):
		current_state = STATE.BOM_RUN
		is_bomb = true
		if(moving_speed >= 110): 
			moving_speed -= 20
	if(moving_style >= MOVING_STYLE.THROW_BOX_ATTACK 
		&& moving_style <= MOVING_STYLE.BOX_RUN):
		current_state = STATE.BOX_RUN

	
func _physics_process(_delta):
	moving()
	
func moving():
	match(current_state):
		STATE.RUN:
			animation_player.play("run")
			run()
		STATE.BOX_RUN:
			animation_player.play("box_run")
			run()
		STATE.BOM_RUN:
			animation_player.play("bom_run")
			run()
		STATE.BOM_TRROW:
			animation_player.play("bom_throw")
			run()
		STATE.BOX_THROW:
			animation_player.play("box_throw")
			run()
		STATE.ATTACK:
			animation_player.play("attack")
			run()
		STATE.FALL:
			animation_player.play("fall")
			fall()
		STATE.JUMP:
			animation_player.play("jump")
			jump()
	if move_and_slide(velocity, Vector2.UP): 
		pass
		

func run():
	velocity = Vector2(
		-moving_speed, 
		min(velocity.y + gravity, GameSettings.terminal_gravity)
	)

func jump():
	current_state = STATE.FALL
	velocity = Vector2(-jump_speed, -jump_force)
	
func fall():
	velocity = Vector2(
		-moving_speed,
		min(velocity.y + gravity, GameSettings.terminal_gravity)
	)
	if(is_on_floor()):
		current_state = STATE.RUN
		
func go_jump():
	if(moving_style > MOVING_STYLE.RUN):
		current_state = STATE.JUMP

func go_run():
	current_state = STATE.RUN

func attack_animation_finished():
	current_state = STATE.RUN
	
func bomb_throw_animation_finished():
	var bomb_ins : KinematicBody2D
	if(is_bomb):
		bomb_ins = load(bomb).instance()
	else:
		bomb_ins = load(box).instance()
	bomb_ins.position = Vector2(3, -2)
	bomb_ins.pig_moving_speed = moving_speed
	self.add_child(bomb_ins)



					
func go_attack():
	current_state = STATE.ATTACK

func go_box_throw():
	current_state = STATE.BOX_THROW

func go_bom_throw():
	current_state = STATE.BOM_TRROW
	
		
func do_action():
	if(moving_style == MOVING_STYLE.JUMP_NEAR_ATTACK_FAR 
	|| moving_style == MOVING_STYLE.TWO_ATTACK
	|| moving_style == MOVING_STYLE.ONE_ATTACK_FAR):
		go_attack()
	if(moving_style == MOVING_STYLE.JUMP_FAR_ATTACK_NEAR
	|| moving_style == MOVING_STYLE.TWO_JUMP
	|| moving_style == MOVING_STYLE.ONE_JUMP_FAR):
		go_jump()
		
	if(moving_style >= MOVING_STYLE.THROW_BOM_ATTACK
	&& moving_style <= MOVING_STYLE.THROW_BOM_RUN):
		go_bom_throw()
		
	if(moving_style >= MOVING_STYLE.THROW_BOX_ATTACK
	&& moving_style <= MOVING_STYLE.THROW_BOX_RUN):
		go_box_throw()


func _on_DoActionZone_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	if(moving_style == MOVING_STYLE.JUMP_FAR_ATTACK_NEAR 
	|| moving_style == MOVING_STYLE.ONE_ATTACK_NEAR
	|| moving_style == MOVING_STYLE.TWO_ATTACK
	|| moving_style == MOVING_STYLE.THROW_BOM_ATTACK
	|| moving_style == MOVING_STYLE.THROW_BOX_ATTACK):
		go_attack()
	if(moving_style == MOVING_STYLE.JUMP_NEAR_ATTACK_FAR 
	|| moving_style == MOVING_STYLE.ONE_JUMP_NEAR
	|| moving_style == MOVING_STYLE.TWO_JUMP
	|| moving_style == MOVING_STYLE.THROW_BOM_JUMP
	|| moving_style == MOVING_STYLE.THROW_BOX_JUMP):
		go_jump()
		do_action_zone.queue_free()
