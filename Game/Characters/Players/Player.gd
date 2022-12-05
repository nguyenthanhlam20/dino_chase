extends Character

class_name Player
		
onready var animated_sprite = $AnimatedSprite
onready var animation_player = $AnimationPlayer
onready var collision_shape = $CollisionShape2D
onready var invicible_time = $InvincibleTime

# Properties
export(int) var move_speed = 100
export(int) var jump_force = 450
export(int) var knock_speed = 300
export(int) var knock_impulse = 200
export(int) var health = 3
export(bool) var invicible = false

var root_node setget set_root_node

export(Vector2) var velocity : Vector2

var current_health = 3
var score = 0 
var highest_score = 0
var longest_distance = 0
var miles = 0 setget set_miles, get_miles
var play_time setget set_play_time, get_play_time

var sec_elapsed = 0

enum STATE {EGG_MOVE, EGG_CRACK, EGG_HATCH, APPEAR, IDLE, RUN, JUMP, FALL, BEND_DOWN, HIT}
var current_state = STATE.EGG_MOVE 

func _ready():
	animation_player.play("egg_move")
#	print(User.data)
	if(self.name == "Rainbow"):
		health = 4
	longest_distance = float(User.data.best.distance.value)
	highest_score = float(User.data.best.score.value)

func _process(_delta):
	if(current_state != STATE.IDLE):
#		sec_elapsed += 1
#		var minutes = sec_elapsed / 3600
#		var miliseconds = sec_elapsed % 60
#		var seconds = sec_elapsed % 3600 / 60
#		var time = "%02d:%02d.%02d" % [minutes, seconds, miliseconds]
#		set_play_time(time)
#		root_node.update_time(time)
		pass
		

	
func _physics_process(_delta):
	match(current_state):
		STATE.EGG_MOVE: 
			collision_shape.position.x = 0
			collision_shape.position.y = -0.2
			
			
			collision_shape.scale.y = 0.8
			
			collision_shape.scale.x = 0.8
			root_node.set_running(false)
			animation_player.play("egg_move")
			normal_run()
		STATE.EGG_CRACK: 
			root_node.set_running(false)
			animation_player.play("egg_crack")
			normal_run()
		STATE.EGG_HATCH: 
			root_node.set_running(false)
			animation_player.play("egg_hatch")
			normal_run()
		STATE.APPEAR: 
			collision_shape.position.y = 0
			root_node.set_running(false)
			animation_player.play("appear")
			normal_run()
		STATE.IDLE: 
			collision_shape.position.y = 0.5
			collision_shape.position.x = -0.5
			collision_shape.scale.y = 0.85
			collision_shape.scale.x = 0.75
			root_node.set_running(false)
			animation_player.play("idle")
			normal_run()
		STATE.RUN:
			collision_shape.position.y = 0.5
			collision_shape.position.x = -0.5
			collision_shape.scale.y = 0.85
			collision_shape.scale.x = 0.75
			animation_player.play("run")
			root_node.set_running(true)
			normal_run()
		STATE.BEND_DOWN:
			print("dm ebnd dasdf")
			collision_shape.position.y = 1.5
			collision_shape.position.x = 3
			collision_shape.scale.y = 0.75
			collision_shape.scale.x = 0.9
			animation_player.play("bend_down")
			root_node.set_running(true)
			normal_run()
		STATE.JUMP:
			if(is_on_floor()):
				print("in the floor")
				root_node.set_running(true)
				jump()
		STATE.FALL:
			animation_player.play("fall")
			normal_run()
			if(is_on_floor()):
				current_state = STATE.RUN
		STATE.HIT:
			collision_shape.position.x = -1.5
			collision_shape.position.y = 0
			collision_shape.scale.y = 0.9
			collision_shape.scale.x = 0.85
			animation_player.play("hit")
			root_node.set_running(false)
			normal_run()
	if(velocity.y == -jump_force):
		current_state = STATE.FALL
	if move_and_slide(velocity, Vector2.UP): 
		pass
#	print(GameSettings.is_effect_playing)
	if(GameSettings.is_effect_playing == false):
		GameSettings.stopEffect()
	if(current_state != STATE.HIT):
		pick_new_state()

func set_play_time(value):
	play_time = value

func get_play_time():
	return play_time

func set_miles(value):
	miles = value

func get_miles():
	return miles

func inscrease_miles(value):
	miles += value
	
func set_root_node(value):
	root_node = value


func normal_run():
	
	velocity = Vector2(
		0,
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)	
	
func play_hit_effect():
	GameSettings.playEffect("res://Resource/Music/hit_effect.mp3")
	
func game_over():
	Common.paused_game(true)
	root_node.show_game_over_screen()
	
	if(score > highest_score):
		highest_score = score
	
	if(miles > longest_distance):
		longest_distance = miles
	
	update_user_data()

func update_user_data():
	User.data.best.score.value = highest_score
	User.data.best.distance.value = longest_distance
	User.data.general.game_time.value += sec_elapsed
	User.data.general.runs.value += 1
	User.save_user_data()
	
func increase_score():
	if(current_health == self.health):
		score += 1
		root_node.update_score(score)
	else:
		current_health = self.health

func egg_move_animation_finished():
	current_state = STATE.EGG_CRACK

func egg_crack_animation_finished():
	current_state = STATE.EGG_HATCH
	
func egg_hatch_animation_finished():
	current_state = STATE.APPEAR
	
func appear_animation_finished():
	current_state = STATE.IDLE
	collision_shape.position.y = 0

func jump_animation_finished():
	current_state = STATE.FALL

func idle_animation_finished():
	root_node.enable_touch_screen_btns(true)
		
func animation_finished():
	current_state = STATE.RUN
	root_node.set_running(true)
	
func jump():
	if(GameSettings.is_effect_playing == false):
		animation_player.play("jump")
		GameSettings.playEffect("res://Resource/Music/jump_effect.mp3")
	velocity = Vector2(
			0,
			-jump_force
		)
		

func get_hit(damage : int):
	if(!invicible):
		self.health -= damage
		root_node.remove_health(self.health)
		if(self.health == 0):
			game_over()
		current_state = STATE.HIT
		animation_player.play("hit")

		if move_and_slide(velocity, Vector2.UP): 
			pass
	
func start_invicible_time():
	invicible = true
	invicible_time.start()
	
func pick_new_state():
	if(Input.is_action_just_pressed("jump") && is_on_floor()):
		current_state = STATE.JUMP
	elif(Input.is_action_pressed("bend_down") && is_on_floor()):
		current_state = STATE.BEND_DOWN
	elif(current_state == STATE.BEND_DOWN):
		current_state = STATE.RUN
		

func _on_InvincibleTime_timeout():
	invicible = false


