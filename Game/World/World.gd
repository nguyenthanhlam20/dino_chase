extends Control


onready var player = $Player
onready var enemies = $Enemies
onready var pause_btn = $TopControls/Right/Pause
onready var bottom_controls = $BottomControls
onready var health_container = $Profile/Health
onready var mile_lable = $LabelGroup/VBoxContainer/MileLabel
onready var time_label = $LabelGroup/VBoxContainer/TimeLabel
onready var mile_timer = $TimerGroup/MileTimer
onready var coin_timer = $TimerGroup/CoinTimer
onready var remove_coin_timer = $TimerGroup/RemoveCoinTimer
onready var spawn_timer = $TimerGroup/SpawnEnemyTimer
onready var stop_zone = $StopZone
onready var background = $Background
onready var score_label = $TopControls/CenterContainer/Score
onready var health_node = $Profile/Health
onready var map_container = $Map
onready var start_object = $StartObject
onready var bend_down = $BottomControls/BendownContainer/BendDown

onready var Heart = load(Constants.HEART)
onready var particles = load(Constants.PARTICLES)
onready var coin = load(Constants.COIN)
onready var game_over_screen = load(Constants.GAME_OVER_SCREEN)
onready var paused_screen = load(Constants.PAUSED_SCREEN)

onready var season_enemies = EnemySettings.get_enemies()
onready var original_enemy = []
var unlock_enemies = []
var particle_instance : KinematicBody2D
var enemy : KinematicBody2D
var enemy_position : Vector2
var player_health : int
var player_position = GameSettings.player_position_x
var is_running : bool
var is_new_enemy_added = false
var new_enemy_index : int

var generated_enemy_index : int
var current_index = -1

func get_unlock_enemies() -> void:
	var original_unl_enemy = User.data.completion.enemy.get(MapSettings.get_current_map_name())
	for index in original_unl_enemy:
		unlock_enemies.append(index)
		
func _ready():
	get_unlock_enemies()
	get_tree().set_current_scene(self)
	stopping()
	enable_touch_screen_btns(false)
	add_hearts()
	put_map()
	put_player()
	set_input_position()
	show_timer()
	set_running(false)
	coin_timer.start()
#	spawn_enemy()
	
func enable_buttons():
	paused_screen.enable_buttons()
	
func add_hearts():
	player_health = PlayerSettings.get_player_info("health")
	for number in range(0, player_health):
		print('add heart: ', number + 1)
		var heart = Heart.instance()
		health_container.add_child(heart)
	
func put_map():
	var map = MapSettings.get_current_map()
	map_container.add_child(map)

func put_player():
	GameSettings.gravity = 5
#	Add player
	var current_player = PlayerSettings.get_current_player()
	current_player.position = Vector2(29.5, 0)
	current_player.name = "Player"
	current_player.health = player_health;
	
	var paricles_inst = particles.instance()
	paricles_inst.position = Vector2(29.5, 100)
	
	particle_instance = paricles_inst
	self.add_child(paricles_inst)
	self.add_child(current_player)
	
	player = current_player
	player.set_root_node(self)
	player.set_heath(PlayerSettings.get_player_health())
	start_object.set_root_node(self)
#	Set player parent nodes

func change_start_object_layer():
	start_object.set("collision_layer", 6)


func set_input_position():
	var jump_container = bottom_controls.get_node("JumpContainer")
	if(GameSettings.swap_input):
		bottom_controls.move_child(jump_container, 0)
	else:
		bottom_controls.move_child(jump_container, 1)
		
func show_timer():
	time_label.visible = GameSettings.timer_status
		
func spawn_enemy():
	if(is_instance_valid(player)):
		generate_enemy()
var current_mile : int

func add_new_enemy() -> void:
	if(unlock_enemies.size() < season_enemies.size()):
		current_mile = player.get_miles()
		var lasted_enemy = unlock_enemies[unlock_enemies.size() - 1]
		var next_enemy = lasted_enemy + 1
		var ene = season_enemies[next_enemy]
		if(ene.get("unlock_at") <= current_mile):
			is_new_enemy_added = true
			new_enemy_index = next_enemy
			unlock_enemies.append(next_enemy)
			original_enemy.append(load(ene.get("sprite")))
			print("lasted: ", lasted_enemy, ", next: ", next_enemy, "----: ", unlock_enemies)
		
func generate_enemy():
#	if(current_index == original_enemy.size() - 1):
#		current_index = -1
#	current_index += 1
	generated_enemy_index = 14
	
#	generated_enemy_index = Common.get_random_number(0, original_enemy.size() - 1)
	if(is_new_enemy_added):
		generated_enemy_index = new_enemy_index
		is_new_enemy_added = false
#	generated_enemy_index = 13
	enemy = original_enemy[generated_enemy_index].instance()
	player_position = GameSettings.player_position_x
	print("genrated index: ", generated_enemy_index, ", name: ", enemy.name)
	
	enemy_position = Vector2(player_position + enemy.position_x, enemy.position_y)
	enemy.position = enemy_position
	enemies.add_child(enemy)
	
	
func _on_SpawnEnemyTimer_timeout():
	spawn_enemy()
#	pass

func show_paused_btn(value):
	pause_btn.visible = value
	
func show_label(value):
#	time_label.visible = value
	score_label.visible = value
	pause_btn.visible = value
#	mile_lable.visible = value


	

func _on_DeathZone_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print('death zone enter: ', body_rid, body, body_shape_index, local_shape_index)
	body.queue_free()

func _on_Pause_pressed():
	show_paused_btn(false)
	get_tree().paused = true
#	Common.set_pause_node(get_tree().get_root().get_node("World"), false)

func enable_touch_screen_btns(value):
	bottom_controls.set("visible", value)

func starting():
	bend_down.set("action", "bend_down")
	mile_timer.start()
	spawn_timer.start()
	player.set_is_start(true)
	
func stopping():
	bend_down.set("action", "jump")
	mile_timer.stop()
	spawn_timer.stop()
	

func _on_MileTimer_timeout():
	if(is_running):
		player.inscrease_miles(1)
		current_mile = player.get_miles()
#		if(current_mile % 50 == 0):
#			add_new_enemy()
		mile_lable.text = str(current_mile) + "m"

func show_game_over_screen():
	player.set_enemy_completion(unlock_enemies)
	show_label(false)
	var gos_ins = game_over_screen.instance()
	
	game_over_screen.show_result(player)
	game_over_screen.set_root_node(self)
	self.add_child(gos_ins)

func update_coin(value):
#	self.get_node("Coin").queue_free()
	score_label.text = "Coin: " + str(value)
	reset_coin_timer()

func remove_health(index):
	var heart = health_node.get_child(index)
	health_node.remove_child(heart)

func set_running(value):
	is_running = value
#	print("i go to is running signal")
	var map = map_container.get_child(0)
	map.set_is_running(value)

func update_time(value):
	time_label.text = value
	
	
func reset_coin_timer():
	coin_timer.start()
	remove_coin_timer.stop()
	pass

func _on_CoinTimer_timeout():
	var coin_instance = coin.instance()
	coin_instance.set("position", Vector2(29, 78))
	self.add_child(coin_instance)
	remove_coin_timer.start()

func _on_RemoveCoinTimer_timeout():
	if(self.has_node("Coin")):
		var coin_node = self.get_node("Coin")
		coin_node.play_disappear()
		coin_timer.start()


func _on_StopZone_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body.name == "StartObject"):
		body.play_stop()
		print("stop zone entered: ", body_rid, body, body_shape_index, local_shape_index)
	else:
		if(body is ZicZacEnemy):
			body.go_highest()
		elif(body is Radish_Enemy):
			body.go_to_run_state()
		

func _on_GoDownZone_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body is Jackson):
		print(body)
		body.go_down()
	elif(body is JumpingEnemy):
		body.go_jump()
	elif(body is FatBird):
		body.go_jump()
	elif(body is TurnBackEnemy):
		body.turn_back()
	

func stop_running(value):
	set_running(value)
	player.set_running_state(value)

func _on_StopZoneRight_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body is BulletEnemy):
		body.go_stop()
		body.set_root_node(self)
		player.set_bullet_enemy_appear(true)
		stop_running(false)
	elif(body is JRAEnemy):
		body.do_action()

func set_bullet_enemy_appear(value: bool) -> void:
	player.set_bullet_enemy_appear(value)
		
func set_particle_run_state():
	particle_instance.set_run_state()
	
func set_particle_idle_state():
	particle_instance.set_idle_state()
	
func set_particle_jump_state():
	particle_instance.set_jump_state()
	
func set_particle_fall_state():
	particle_instance.set_fall_state()

func remove_coin():
	if(self.has_node("Coin")):
		var coin_node = self.get_node("Coin")
		self.remove_child(coin_node)

func stop_timer() -> void:
	spawn_timer.stop()
	remove_coin_timer.stop()
	coin_timer.stop()

func stop_spawning_enemy():
	set_running(false)
	stop_timer()
	remove_coin()
	
func stop_all_objects():
	set_running(false)
	spawn_timer.stop()
	player.play_stop()
	self.remove_child(self.get_node("Enemies"))
	
