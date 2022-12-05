extends KinematicBody2D

		
onready var animated_sprite = $AnimatedSprite
onready var animation_player = $AnimationPlayer
onready var collision_shape = $CollisionShape2D

var velocity : Vector2

enum STATE {IDLE, RUN, JUMP, FALL, HIT}
var current_state = STATE.IDLE 

func _ready():
	animation_player.play("idle")

func _physics_process(_delta):
	match(current_state):
		STATE.IDLE: 
			animation_player.play("idle")

		STATE.RUN: 
			animation_player.play("run")
			normal_run()
		STATE.JUMP: 
			animation_player.play("jump")
			normal_run()
		STATE.FALL: 
			animation_player.play("fall")
			normal_run()
		STATE.HIT: 
			animation_player.play("hit")
			normal_run()	
			
	
	
	if move_and_slide(velocity, Vector2.UP): 
		pass
	
	pick_new_state()
		
func normal_run():
	velocity = Vector2(
		0,
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)	

func get_hit(damage : int):
	current_state = STATE.HIT

func hit_animation_finished():
	current_state = STATE.RUN

func jump_animation_finished():
	current_state = STATE.RUN
	
func pick_new_state():
	if(Input.is_action_just_pressed("jump")):
		current_state = STATE.JUMP

	
		


