extends KinematicBody2D

class_name Player
		
onready var animated_sprite = $AnimatedSprite
onready var animation_player = $AnimationPlayer
onready var collision_shape = $CollisionShape2D
onready var invicible_time = $InvincibleTime
onready var current_character_name = PlayerSettings.get_player_info("key_name")
onready var current_map_name = MapSettings.get_map_info("map_name").to_lower()


# Properties
export(int) var move_speed = 100
export(int) var jump_force = 300
export(int) var jump_death_force = 300
export(int) var health = 3
export(bool) var invicible = false
export(Vector2) var velocity : Vector2


var root_node setget set_root_node
var small_particle setget set_particle

var current_health = 2
var coin = 0 
var longest_distance = 0
var miles = 0 setget set_miles, get_miles
var play_time setget set_play_time, get_play_time
var enemy_completion : Array setget set_enemy_completion
var sec_elapsed = 0
var jump_status : bool
var is_start = false
var is_allow_touch_screen = true
var is_death = false

func set_heath(value: int):
	current_health = value

func set_particle(value):
	small_particle = value
	
enum STATE {EGG_MOVE, EGG_CRACK, EGG_HATCH, APPEAR, 
	IDLE, RUN, JUMP, HOLD, FALL, BEND_DOWN, BEND_DOWN_IDLE, 
	HIT, JUMP_DEATH, PRE_DEATH, POST_DEATH, DEATH, GRAVE}
var current_state = STATE.EGG_MOVE 


func set_is_start(value : bool) -> void:
	is_start = value 
	
func _ready():
	animated_sprite.frames = load(PlayerSettings.get_player_info("frame"))
	longest_distance = float(User.get_longest_distance(current_map_name))


func _process(_delta):
	if(is_start):
		sec_elapsed += 1
		var minutes = sec_elapsed / 3600
		var miliseconds = sec_elapsed % 60
		var seconds = sec_elapsed % 3600 / 60
		var time = "%02d:%02d.%02d" % [minutes, seconds, miliseconds]
		set_play_time(time)
		root_node.update_time(time)

func play_stop():
	current_state = STATE.IDLE

func _physics_process(_delta):
	match(current_state):
		STATE.EGG_MOVE: 
			collision_shape.position.x = 0
			collision_shape.position.y = -0.2
			collision_shape.scale.y = 0.8
			collision_shape.scale.x = 0.8
			animation_player.play("egg_move")
			normal_run()
		STATE.EGG_CRACK: 
			animation_player.play("egg_crack")
		STATE.EGG_HATCH: 
			animation_player.play("egg_hatch")
		STATE.APPEAR: 
			collision_shape.position.y = 0
			animation_player.play("appear")
		STATE.IDLE: 
			collision_shape.position.y = 0.5
			collision_shape.position.x = -0.5
			collision_shape.scale.y = 0.85
			collision_shape.scale.x = 0.75
			small_particle.set_idle_state()
			root_node.set_running(false)
			normal_run()
			animation_player.play("idle")
		STATE.RUN:
			collision_shape.position.y = 0.5
			collision_shape.position.x = -0.5
			collision_shape.scale.y = 0.85
			collision_shape.scale.x = 0.75
			animation_player.play("run")
			small_particle.set_run_state()
			root_node.set_running(true)
			normal_run()
		
		STATE.BEND_DOWN_IDLE: 
			collision_shape.position.y = 1.5
			collision_shape.position.x = 3
			collision_shape.scale.y = 0.75
			collision_shape.scale.x = 0.9
			animation_player.play("bend_down_idle")
			normal_run()
		STATE.BEND_DOWN:
			collision_shape.position.y = 1.5
			collision_shape.position.x = 3
			collision_shape.scale.y = 0.75
			collision_shape.scale.x = 0.9
			small_particle.set_run_state()
			animation_player.play("bend_down")
			normal_run()
			root_node.set_running(true)
		STATE.JUMP:
			if(is_on_floor()):
				jump()
				small_particle.set_jump_state()
				root_node.set_running(true)
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
			small_particle.set_idle_state()
			normal_run()
			
		STATE.JUMP_DEATH:
			collision_shape.position.x = -0.5
			collision_shape.position.y = 0
			collision_shape.scale.y = 0.8
			collision_shape.scale.x = 0.73
			animation_player.play("pre_death")
			root_node.stop_spawning_enemy()
			small_particle.set_idle_state()
			play_hit_effect()
			jump_death()
			
		STATE.PRE_DEATH:
			animation_player.play("pre_death")
			play_death()
		STATE.POST_DEATH:
			animation_player.play("post_death")
		STATE.GRAVE:
			self.rotation_degrees = 0
			animation_player.play("grave")
		STATE.DEATH:
			self.rotation_degrees = 3
			animation_player.play("death")
			stop_animation()
#	print("velocity: ", velocity)
	
	if move_and_slide(velocity, Vector2.UP): 
			pass
#	print(self.position)
	if(velocity.y == -jump_force && current_state == STATE.JUMP):
		current_state = STATE.FALL
	if(velocity.y == -jump_death_force && current_state == STATE.JUMP_DEATH):
		current_state = STATE.PRE_DEATH
##	print(GameSettings.is_effect_playing)
#	if(GameSettings.is_effect_playing == false):
#		GameSettings.stopEffect()
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

func stop_animation():
	velocity = Vector2(
		0,
		min(velocity.y + 10, GameSettings.terminal_gravity)
	)
func play_death():
	
	if(is_on_floor()):
		current_state = STATE.DEATH
#		velocity = Vector2(
#			0,
#			min(velocity.y + 10, GameSettings.terminal_gravity)
#		)
	else:
		velocity = Vector2(
			127,
			min(velocity.y + 10, GameSettings.terminal_gravity)
		)
		self.rotation_degrees += 17.865
		

func jump_death():

	velocity = Vector2(velocity.x + 0.5, -jump_death_force)


func normal_run():
	velocity = Vector2(
		0,
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
	)	
	
func play_hit_effect():
	GameSettings.playEffect(Constants.HIT_EFFECT)
	
func game_over():
	Common.paused_game(true)
	root_node.show_game_over_screen()

	if(miles > longest_distance):
		longest_distance = miles
	
	update_user_data()

func update_user_data():
	

	User.data.best_distance.get(current_map_name).value = longest_distance
	User.data.map_pick.get(current_map_name).value += 1
	User.data.character_pick.get(current_character_name).value += 1
	User.data.general.game_time.value += int(sec_elapsed % 3600 / 60)
	User.data.general.runs.value += 1
	User.data.general.coins.value += coin
	var unlock_enemies = User.data.completion.enemy.get(current_map_name)
	unlock_enemies.clear()
	
	for index in enemy_completion:
		unlock_enemies.append(index)
	User.save_user_data()


func gain_coin():
	coin += 1
	root_node.update_coin(coin)
	

func egg_move_animation_finished():
	current_state = STATE.EGG_CRACK

func egg_crack_animation_finished():
	current_state = STATE.EGG_HATCH
	
func egg_hatch_animation_finished():
	current_state = STATE.APPEAR
	
func appear_animation_finished():
	current_state = STATE.IDLE
	collision_shape.position.y = 0
	GameSettings.gravity = 15

func jump_animation_finished():
	current_state = STATE.FALL
	
func pre_death_animation_finished():
	current_state = STATE.DEATH
	
func death_animation_finished():
	current_state = STATE.POST_DEATH
	
func post_death_animation_finished():
	current_state = STATE.GRAVE

func idle_animation_finished():
	root_node.enable_touch_screen_btns(true)
	
func animation_finished():
	current_state = STATE.RUN
	root_node.set_running(true)
	
func jump():
	play_jump_effect()
	velocity = Vector2(0, -jump_force)
	

func play_jump_effect():
	GameSettings.playEffect(Constants.JUMP_EFFECT)

func get_hit(damage : int) -> void:
	if(!invicible && !is_death):
		is_allow_touch_screen = false
		self.health -= damage
		root_node.remove_health(self.health)
		if(self.health == 0):
			
			is_death = true
			self.rotation_degrees = -360
			if(is_on_floor()):
				jump_death_force = 300
			else: 
				jump_death_force = 250
			current_state = STATE.JUMP_DEATH
		else:
			current_state = STATE.HIT

		if move_and_slide(velocity, Vector2.UP): 
			pass

func start_invicible_time():
	invicible = true
	invicible_time.start()



func pick_new_state():
#	if(Input.is_action_just_pressed("jump")):
#		current_state = STATE.JUMP
	if(is_allow_touch_screen):
		if(Input.is_action_just_pressed("jump") && is_on_floor()):
			current_state = STATE.JUMP
		elif(Input.is_action_pressed("bend_down") && is_on_floor()):
			current_state = STATE.BEND_DOWN
		elif((current_state == STATE.BEND_DOWN || current_state == STATE.BEND_DOWN_IDLE)):
			current_state = STATE.RUN

func hit_animation_finished():
	is_allow_touch_screen = true
	current_state = STATE.RUN
		
func _on_InvincibleTime_timeout():
	invicible = false

func set_running_state(value: bool):
	if(value):
		current_state = STATE.RUN
	else:
		current_state = STATE.IDLE

func set_enemy_completion(value: Array):
	enemy_completion = value
