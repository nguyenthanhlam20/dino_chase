extends Control


onready var player : KinematicBody2D
onready var enemies = $MainContent/Enemies
onready var pause_btn = $MainContent/TopControls/Pause
onready var bottom_controls = $MainContent/BottomControls
onready var paused_screen = $PopupScreens/PausedSceen
onready var popup_screens = $PopupScreens
onready var health_container = $MainContent/Profile/Health
onready var main_content = $MainContent
onready var mile_lable = $MainContent/LabelGroup/VBoxContainer/MileLabel
onready var time_label = $MainContent/LabelGroup/VBoxContainer/TimeLabel
onready var mile_timer = $MainContent/TimerGroup/MileTimer
onready var spawn_timer = $MainContent/TimerGroup/SpawnEnemyTimer
onready var background = $Background
onready var score_label = $MainContent/TopControls/CenterContainer/Score
onready var health_node = $MainContent/Profile/Health
onready var map_container = $MainContent/Map
onready var original_enemy = EnemyFactory.get_enemies()
onready var start_object = $MainContent/StartObject
onready var bend_down = $MainContent/BottomControls/BendownContainer/BendDown
onready var Heart = preload("res://Game/Characters/Heart.tscn")
onready var particles = preload("res://Game/Characters/Particles.tscn")



var enemy
var enemy_position : Vector2
var miles = 0
var player_health : int

const current_enemy_arr = []
	
func _ready():
	stopping()
	enable_touch_screen_btns(false)
	add_hearts()
	put_map()
	put_player()
	set_input_position()
	show_timer()
#	spawn_enemy()
	
func enable_buttons():
	paused_screen.enable_buttons()
	
func add_hearts():
	player_health = PlayerSettings.get_player_health()
	for number in range(0, player_health):
		print('add heart: ', number + 1)
		var heart = Heart.instance()
		health_container.add_child(heart)
	
func put_map():
	var map = MapSettings.get_current_map()
	map_container.add_child(map)


func put_player():
#	Add player
	var current_player = PlayerSettings.get_current_player()
	current_player.position = Vector2(29.5, 110)
	current_player.name = "Player"
	current_player.health = player_health;
	
	var paricles_instance = particles.instance()
	paricles_instance.position = Vector2(29.5, 110)
	
	main_content.add_child(paricles_instance)
	main_content.add_child(current_player)
	
	player = current_player
	player.set_root_node(self)
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
		
func append_enemy(value):
	current_enemy_arr.append(value)
		
func generate_number():
	return GameSettings.random.randi_range(0, original_enemy.size() - 1)

func insert_enemy():
	var index = player.score / 1
	if(index < original_enemy.size()):
		var enemy_at_index = original_enemy[index]
		if(!current_enemy_arr.has(enemy_at_index)):
			append_enemy(enemy_at_index)
			

func spawn_enemy():
	if(is_instance_valid(player)):
		generate_enemy()
#		if(player.score % 1 == 0 
#			&& original_enemy.size() != current_enemy_arr.size()):
#			insert_enemy()	
		
		
func generate_enemy():
	var index = generate_number()
	print("genrated index: ", index)
	var player_position = player.position
	enemy = original_enemy[index].instance()

	if(enemy is RunningEnemy):
		enemy_position = Vector2(player_position.x + 380, 120)
	elif(enemy is JumpingEnemy):
		enemy_position = Vector2(player_position.x + 380, 120)
	else:
		enemy_position = Vector2(player_position.x + 380, 120) 
#		107
	enemy.position = enemy_position
	enemies.add_child(enemy)

	
func _on_SpawnEnemyTimer_timeout():
	spawn_enemy()
#	pass

func show_main_content(value):
	main_content.visible = value
	show_background(value)
	show_paused_btn(value)
	
func show_background(value):
	background.visible = value
	
func show_paused_btn(value):
	pause_btn.visible = value
	
func show_paused_screen(value):
	paused_screen.visible = value

	
func show_label(value):
#	time_label.visible = value
	score_label.visible = value
	pause_btn.visible = value
#	mile_lable.visible = value

#func _process(delta):
#	print("paused mode------ ", pause_mode)

func _on_DeathZone_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print('death zone enter: ', body_rid, body, body_shape_index, local_shape_index)
	if(is_instance_valid(player)):
		player.increase_score()
	body.queue_free()

func _on_Pause_pressed():
	show_paused_screen(true)
	show_paused_btn(false)
	show_background(true)
	Common.set_pause_node(get_tree().get_root().get_node("World"), false)

func enable_touch_screen_btns(value):
	bottom_controls.set("visible", value)

func starting():
	bend_down.set("action", "bend_down")
	mile_timer.start()
	spawn_timer.start()
	
func stopping():
	bend_down.set("action", "jump")
	mile_timer.stop()
	spawn_timer.stop()
	

func _on_MileTimer_timeout():
	player.inscrease_miles(1)
	mile_lable.text = str(player.get_miles()) + "m"

func show_game_over_screen():
	show_label(false)
	show_paused_screen(false)
	show_background(true)
	var game_over_screen = Screen.game_over_screen.instance()
	add_popup_screen(game_over_screen)
	game_over_screen.show_result(player)
	game_over_screen.set_root_node(self)
	game_over_screen.show_popup()


func update_score(value):
	score_label.text = "Score: " + str(value)


func remove_health(index):
	var heart = health_node.get_child(index)
	health_node.remove_child(heart)

func set_running(value):
#	print("i go to is running signal")
	var map = map_container.get_child(0)
	map.set_is_running(value)



func add_popup_screen(screen):
#	print("on world add popup screen")
	popup_screens.add_child(screen)

func update_time(value):
	time_label.text = value
