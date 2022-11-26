extends Character

class_name Player
		
onready var animated_sprite = $AnimatedSprite
onready var animation_tree = $AnimationTree
onready var animation_player = $AnimationPlayer
onready var collision_shape = $CollisionShape2D
onready var invicible_time = $InvincibleTime

# Properties
export(int) var move_speed = 100
export(int) var jump_force = 500
export(int) var knock_speed = 300
export(int) var knock_impulse = 200
export(int) var health = 3
export(bool) var invicible = false

var root_node setget set_root_node

var velocity : Vector2

var current_health = 3
var score = 0 
var highest_score = 0
var longest_distance = 0
var miles = 0 setget set_miles, get_miles
var play_time setget set_play_time, get_play_time

var sec_elapsed = 0

enum STATE {RUN, JUMP, BEND_DOWN, HIT}
var current_state = STATE.RUN 

func _ready():
#	print(User.data)
	if(self.name == "Rainbow"):
		health = 4
	longest_distance = float(User.data.best.distance.value)
	highest_score = float(User.data.best.score.value)

func _process(_delta):
	sec_elapsed += 1
	var minutes = sec_elapsed / 3600
	var miliseconds = sec_elapsed % 60
	var seconds = sec_elapsed % 3600 / 60
	var time = "%02d:%02d.%02d" % [minutes, seconds, miliseconds]
	set_play_time(time)
	root_node.update_time(time)
	
func _physics_process(_delta):
	match(current_state):
		STATE.RUN:
			collision_shape.position.y = 0.444
			collision_shape.position.x = -0.5
			collision_shape.scale.y = 1
			collision_shape.scale.x = 1
			animation_player.play("run")
			normal_run()
		STATE.BEND_DOWN:
			collision_shape.position.y = 1.5
			collision_shape.position.x = 3
			collision_shape.scale.y = 0.88
			collision_shape.scale.x = 1.2
			animation_player.play("bend_down")
			normal_run()
		STATE.JUMP:
			if(is_on_floor()):
				jump()
		STATE.HIT:
			collision_shape.position.y = 1.5
			collision_shape.position.x = 3
			collision_shape.scale.y = 0.9
			collision_shape.scale.x = 1.2
			animation_player.play("hit")
			root_node.set_running(false)
			normal_run()
			
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
	if(Input.is_action_just_pressed("jump")):
		current_state = STATE.JUMP
	elif(Input.is_action_pressed("bend_down")):
		current_state = STATE.BEND_DOWN
	else:
		current_state = STATE.RUN

func _on_InvincibleTime_timeout():
	invicible = false


