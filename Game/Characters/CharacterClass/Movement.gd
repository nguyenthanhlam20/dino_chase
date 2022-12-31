extends KinematicBody2D

class_name Movement
		
onready var animated_sprite = $AnimatedSprite
onready var animation_player = $AnimationPlayer
onready var collision_shape = $CollisionShape2D

# Properties
export(int) var move_speed = -20
export(int) var jump_force = 300
export(int) var jump_speed = -100

export(Vector2) var velocity : Vector2
enum STATE {BEND_DOWN, IDLE, RUN, EGG_MOVE, EGG_CRACK,
	EGG_HATCH, APPEAR, JUMP, FALL}
var current_state = STATE.EGG_MOVE 

func _ready():
	animated_sprite.flip_h = true

func _physics_process(_delta):
	match(current_state):
		STATE.EGG_MOVE: 
			collision_shape.position.x = 0
			collision_shape.position.y = -0.2
			collision_shape.scale.y = 0.8
			collision_shape.scale.x = 0.8
			animation_player.play("egg_move")
			stand()
		STATE.EGG_CRACK: 
			animation_player.play("egg_crack")
		STATE.EGG_HATCH: 
			animation_player.play("egg_hatch")
		STATE.APPEAR: 
			animation_player.play("appear")
		STATE.IDLE: 
			animation_player.play("idle")
			collision_shape.position.y = 0.5
			collision_shape.position.x = -0.5
			collision_shape.scale.y = 0.85
			collision_shape.scale.x = 0.75
			stand()
		STATE.RUN:
			animation_player.play("run")
			run()
		STATE.BEND_DOWN:
			animation_player.play("bend_down")
			run()
		STATE.JUMP:
			if(is_on_floor()):
				jump()
		STATE.FALL:
			animation_player.play("fall")
			fall()
			if(is_on_floor()):
				set_random_state()

	if move_and_slide(velocity, Vector2.UP): 
			pass
			
func go_to_jump_state() -> void:
	current_state = STATE.JUMP

func jump():
	velocity = Vector2(jump_speed, -jump_force)	
	current_state = STATE.FALL
	
func fall():
	velocity = Vector2(
		jump_speed,
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)	

func set_fip_h(value : bool) -> void:
	animated_sprite.flip_h = value
	
func get_flip_h() -> bool:
	return animated_sprite.flip_h

func stand():
	velocity = Vector2(
		0,
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)	
	
func run():
	velocity = Vector2(
		move_speed,
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)

func egg_move_animation_finished():
	current_state = STATE.EGG_CRACK

func egg_crack_animation_finished():
	current_state = STATE.EGG_HATCH
	
func egg_hatch_animation_finished():
	current_state = STATE.APPEAR
	
func appear_animation_finished():
	current_state = STATE.IDLE

func idle_animation_finished():
	set_random_state()
	
func set_random_state():
	current_state = Common.get_random_number(0, 2)
