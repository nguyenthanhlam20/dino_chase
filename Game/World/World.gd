extends Control


onready var player = $Player
onready var enemies = $Enemies
onready var pause_btn = $TopRightPos/Pause
onready var touch_screen_btns = $TouchScreenBtns
onready var health_container = $TopLeftPos/Health
onready var mile_lable = $BottomLeftPos/VBoxContainer/MileLabel
onready var time_label = $BottomLeftPos/VBoxContainer/TimeLabel
onready var mile_timer = $TimerGroup/MileTimer
onready var coin_timer = $TimerGroup/CoinTimer
onready var remove_coin_timer = $TimerGroup/RemoveCoinTimer
onready var spawn_timer = $TimerGroup/SpawnEnemyTimer
onready var score_label = $TopCenterPos/Score
onready var map_container = $Map
onready var start_object = $StartObject
onready var bend_down_btn = $TouchScreenBtns/BendownContainer/BendDown
onready var jump_btn = $TouchScreenBtns/JumpContainer/Jump
onready var jump_container = $TouchScreenBtns/JumpContainer
onready var stop_zone_left = $StopZoneLeft

onready var Heart = load(Constants.HEART)
onready var particles = load(Constants.PARTICLES)
onready var coin = load(Constants.COIN)
onready var game_over_screen = load(Constants.GAME_OVER_SCREEN)
onready var paused_screen = load(Constants.PAUSED_SCREEN)
onready var cover_background = load(Constants.COVER_BACKGROUND)
onready var current_map = load(MapSettings.get_map_info("url"))


onready var season_enemies = EnemySettings.get_enemies()
onready var original_enemy = EnemyFactory.get_enemies()

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
var rect_shape : RectangleShape2D
var reusable_int : int
var reusable_ins 

func get_unlock_enemies() -> void:
	var original_unl_enemy = User.get_unlock_enemies(MapSettings.get_map_info("map_name").to_lower())
	for index in original_unl_enemy:
		unlock_enemies.append(index)
		
func initialize_object() -> void: 
	swap_input_position()
	rect_shape = RectangleShape2D.new()
	rect_shape.extents.x = GameSettings.right_position.x / 4
	rect_shape.extents.y = GameSettings.right_position.y / 2
	bend_down_btn.shape = rect_shape
	
	rect_shape = RectangleShape2D.new()
	rect_shape.extents.x = GameSettings.right_position.x / 4
	rect_shape.extents.y = GameSettings.right_position.y / 2
	jump_btn.shape = rect_shape
	
func remove_node_by_name(node_path : String) -> void:
	self.remove_child(self.get_node(node_path))
	
func swap_input_position() -> void:
	if(GameSettings.swap_input):
		touch_screen_btns.move_child(jump_container, 0)
	else:
		touch_screen_btns.move_child(jump_container, 1)

func _ready():
	get_unlock_enemies()
	initialize_object()
	get_tree().set_current_scene(self)
	stopping()
	enable_touch_screen_btns(false)
	add_hearts()
	put_map()
	put_player()
	show_timer()
	set_running(false)
	coin_timer.start()
#	spawn_enemy()
	
func enable_buttons():
	self.get_node("PausedScreen").enable_buttons()
	
func add_hearts():
	player_health = PlayerSettings.get_player_info("health")
	for number in range(0, player_health):
		print('add heart: ', number + 1)
		health_container.add_child(Heart.instance())
	
func put_map():
	map_container.add_child(current_map.instance())

func put_player():
	GameSettings.gravity = 5
	
	player.health = player_health;
	
	var paricles_inst = particles.instance()
	paricles_inst.position = Vector2(29.5, 100)
	
	particle_instance = paricles_inst
	self.add_child(paricles_inst)
	player.set_root_node(self)
	player.set_heath(player_health)
	player.set_particle(particle_instance)
	start_object.set_root_node(self)

func change_start_object_layer():
	start_object.set("collision_layer", 6)



		
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
	if(current_index == original_enemy.size() - 1):
		current_index = -1
	current_index += 1
	generated_enemy_index = current_index
	
#	generated_enemy_index = Common.get_random_number(0, original_enemy.size() - 1)
	if(is_new_enemy_added):
		generated_enemy_index = new_enemy_index
		is_new_enemy_added = false
#	generated_enemy_index = 13
	print(original_enemy)
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
	score_label.visible = value
	pause_btn.visible = value

func _on_DeathZone_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print('death zone enter: ', body_rid, body, body_shape_index, local_shape_index)
	body.queue_free()

func _on_Pause_pressed():
	show_paused_btn(false)
	reusable_ins = cover_background.instance()
	self.add_child(reusable_ins)
	reusable_ins = paused_screen.instance()
	self.add_child(reusable_ins)
	get_tree().paused = true

func enable_touch_screen_btns(value):
	touch_screen_btns.set("visible", value)

func starting():
	bend_down_btn.set("action", "bend_down")
	mile_timer.start()
	spawn_timer.start()
	player.set_is_start(true)
	
func stopping():
	bend_down_btn.set("action", "jump")
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
	reusable_ins = cover_background.instance()
	self.add_child(reusable_ins)
	reusable_ins = game_over_screen.instance()
	self.add_child(reusable_ins)
	reusable_ins.set_root_node(self)
	reusable_ins.show_result(player)
	reusable_ins.show_popup()

func update_coin(value):
	score_label.text = "Coin: " + str(value)
	reset_coin_timer()

func remove_health(index):
	health_container.remove_child(health_container.get_child(index))

func set_running(value):
	is_running = value
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
		self.get_node("Coin").play_disappear()
		coin_timer.start()

func stop_running(value):
	set_running(value)
	player.set_running_state(value)


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


func _on_StopZoneLeft_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	if(body is TileMap):
		pass
	else:
		body.do_action()
		stop_zone_left.queue_free()
		

	

func _on_StopZoneRight_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.do_action()

		

