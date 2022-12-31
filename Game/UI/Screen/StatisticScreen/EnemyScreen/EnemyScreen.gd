extends Control

onready var spring_container = $CenterBottomPos/Spring
onready var summer_container = $CenterBottomPos/Summer
onready var autumn_container = $CenterBottomPos/Autumn
onready var winter_container = $CenterBottomPos/Winter

onready var enemy_name = $CenterTopPos/Background/EnemyName
onready var enemy_background = $CenterTopPos/Background
onready var description = $CenterTopPos/Background/Description
onready var avatar = $CenterTopPos/Background/CenterContainer/Avatar

onready var spring = $SeasonContainer/Spring
onready var summer = $SeasonContainer/Summer
onready var autumn = $SeasonContainer/Autumn
onready var winnter = $SeasonContainer/Winter

onready var longest_run = $LongestRun

onready var spring_background = $SeasonContainer/Spring/Background
onready var summer_background = $SeasonContainer/Summer/Background
onready var autumn_background = $SeasonContainer/Autumn/Background
onready var winnter_background = $SeasonContainer/Winter/Background
onready var root_node = self.get_parent()
onready var maps = MapSettings.maps
onready var map_unlock = User.data.completion.map
onready var map_btns_container = $SeasonContainer

enum SEASON {SPRING, SUMMER, AUTUMN, WINTER}
var current_season = SEASON.SPRING

var enemies = []
var enemies_unlock = []
var button = Button.new()
var label = Label.new()
var border_btn_active = StyleBoxFlat.new()
var border_btn_deactive = StyleBoxFlat.new()
var background_btn_active = StyleBoxFlat.new()
var background_btn_deactive = StyleBoxFlat.new()
var styled_background = StyleBoxFlat.new()
var border_season_active = StyleBoxFlat.new()
var border_season_deactive = StyleBoxFlat.new()
var background_season_active = StyleBoxFlat.new()
var background_season_deactive = StyleBoxFlat.new()
var first_line : HBoxContainer
var second_line : HBoxContainer

var list_btn_first = []
var list_btn_second = []

var current_index = 0
var previous_index = -1
var is_first_time = true

var reusable_int : int
var reusable_avt : KinematicBody2D

var enemy_info : Dictionary
var colo : String
var crt_avt_container
var pre_avt_container 
var crt_avt
var map_btn : Label
signal button_click(index)

func _ready() -> void:

#	create default style box
	create_style_box()
#	generate seasons 
	generate_seasons()
	
	hide_season_btns()
	
	show_desired_season(true, false, false, false)
	
#	focus on spring enemies when first time user enter this screen
	set_focus_enemies(spring_container, SEASON.SPRING, EnemySettings.spring_enemies)
	get_longest_run("spring")
func hide_season_btns():

	for map in maps:
		reusable_int = map.get("index")
		map_btn = map_btns_container.get_node(map.get("map_name"))
		if(reusable_int in map_unlock):
			map_btn.visible = true
		else:
			map_btn.visible = false
			
func show_desired_season(spring_visible, summer_visible, autumn_visible, winter_visible):
	spring_container.set("visible", spring_visible)
	summer_container.set("visible", summer_visible)
	autumn_container.set("visible", autumn_visible)
	winter_container.set("visible", winter_visible)

func set_focus_enemies(season_container: VBoxContainer, active_season, enem):
	first_line = season_container.get_child(0)
	second_line = season_container.get_child(1)
	
	list_btn_first = first_line.get_children()
	list_btn_second = second_line.get_children()
	
	
	enemies = enem
	on_season_pressed(active_season)
	

func generate_seasons():
	get_enemies_unlock("spring")
	put_enemies(spring_container, EnemySettings.spring_enemies)
	
	get_enemies_unlock("summer")
	put_enemies(summer_container, EnemySettings.summer_enemies)
	
	get_enemies_unlock("autumn")
	put_enemies(autumn_container, EnemySettings.autumn_enemies)

	get_enemies_unlock("winter")
	put_enemies(winter_container, EnemySettings.winter_enemies)
	
	get_enemies_unlock("spring")

func put_enemies(parent_container: VBoxContainer, enem: Array) -> void:
	generate_container(parent_container)
	generate_enemy(enem)

func create_style_box() -> void: 
	set_style(styled_background, "ffffff", 9)
	set_style(border_btn_active, "ffffff", 5)
	set_style(background_btn_active, "ffffff", 4)
	set_style(border_btn_deactive, "000000", 5)
	set_style(border_season_active, "ffffff", 5)
	set_style(background_btn_deactive, "999999", 4)
	set_style(border_season_deactive, "000000", 5)
	set_style(background_season_active, "ffffff", 4)
	set_style(background_season_deactive, "404040", 4)

func generate_container(parent_container: VBoxContainer):
	first_line = HBoxContainer.new()
	second_line = HBoxContainer.new()

	first_line.set("custom_constants/separation", 3)
	second_line.set("custom_constants/separation", 3)
	parent_container.add_child(first_line)
	parent_container.add_child(second_line)

func generate_enemy(enem: Array) -> void:
	reusable_int = 0
	for enemy in enem: 
		create_label(enemy)
		reusable_int = reusable_int + 1
		if(reusable_int <= Constants.HALF_TOTAL_ENEMY):
			create_btn(first_line)
		else:
			create_btn(second_line)


func create_label(enemy) -> void:
	label = Label.new()
	label.set("margin_left", 1)
	label.set("margin_top", 1)
	label.set("margin_right", -1)
	label.set("margin_bottom", -1)
	label.set("rect_min_size", Vector2(22, 22))
	label.set("custom_styles/normal", background_btn_deactive)
	
	reusable_avt = load(enemy.get("avatar")).instance()
	reusable_avt.adjust_scale(Vector2(0.7, 0.7))
	
	reusable_int = enemy.get("index")
	if(reusable_int in enemies_unlock):
		reusable_avt.set_is_unlock(true)
	else:
		reusable_avt.set_is_unlock(false)
	reusable_avt.enable_playing(false)
	reusable_avt.set("position", Vector2(11, 11))
	label.add_child(reusable_avt)

			
func create_btn(container : HBoxContainer):
	button = Button.new()
	button.connect("pressed", self, "_on_button_pressed")
	button.set("rect_min_size", Vector2(24, 24))
	button.set("custom_styles/hover", border_btn_deactive)
	button.set("custom_styles/pressed", border_btn_active)
	button.set("custom_styles/focus", border_btn_active)
	button.set("custom_styles/disabled", border_btn_deactive)
	button.set("custom_styles/normal", border_btn_deactive)
	button.set("toggle_mode", true)
	button.add_child(label)

	container.add_child(button)
		
	
func set_style(styled_node, color, border_radius):
	styled_node.set("bg_color", color)
	styled_node.set("corner_radius_top_left", border_radius)
	styled_node.set("corner_radius_top_right", border_radius)
	styled_node.set("corner_radius_bottom_right", border_radius)
	styled_node.set("corner_radius_bottom_left",border_radius)
	


func set_season_style(active_season):
	spring.set("custom_styles/normal", border_season_deactive)
	summer.set("custom_styles/normal", border_season_deactive)
	autumn.set("custom_styles/normal", border_season_deactive)
	winnter.set("custom_styles/normal", border_season_deactive)
	
	spring_background.set("custom_styles/normal", background_season_deactive)
	summer_background.set("custom_styles/normal", background_season_deactive)
	autumn_background.set("custom_styles/normal", background_season_deactive)
	winnter_background.set("custom_styles/normal", background_season_deactive)
	
	match(active_season):
		SEASON.SPRING:
			background_season_active.set("bg_color", "81B622")
			spring.set("custom_styles/normal", border_season_active)
			spring_background.set("custom_styles/normal", background_season_active)
		SEASON.SUMMER:
			background_season_active.set("bg_color", "FAC12F")
			summer.set("custom_styles/normal", border_season_active)
			summer_background.set("custom_styles/normal", background_season_active)
		SEASON.AUTUMN:
			background_season_active.set("bg_color", "914110")
			autumn.set("custom_styles/normal", border_season_active)
			autumn_background.set("custom_styles/normal", background_season_active)
		SEASON.WINTER:
			background_season_active.set("bg_color", "CADAE3")
			winnter.set("custom_styles/normal", border_season_active)
			winnter_background.set("custom_styles/normal", background_season_active)
			
func _on_Return_released():
	yield(get_tree().create_timer(0.2), "timeout")
	root_node.show_button_group(true)
	root_node.enable_buttons()
	self.queue_free()

func change_background_color(styled_node, color):
	styled_node.set("bg_color", color)

func _on_EnemyScreen_button_click(index):
	enemy_info = enemies[index]
	colo = enemy_info.get("color")
	change_background_color(background_btn_active, colo)
	
	styled_background.set("bg_color", colo)
	enemy_background.set("custom_styles/normal", styled_background)
	
	reusable_int = list_btn_first.size()
	if(index >= Constants.HALF_TOTAL_ENEMY):
		crt_avt_container = list_btn_second[index - reusable_int].get_child(0)
		crt_avt_container.set("custom_styles/normal", background_btn_active)
		crt_avt = crt_avt_container.get_child(0)
		crt_avt.enable_playing(true)
	else:
		crt_avt_container = list_btn_first[index].get_child(0)
		crt_avt_container.set("custom_styles/normal", background_btn_active)
		crt_avt = crt_avt_container.get_child(0)
		crt_avt.enable_playing(true)

	if(previous_index != -1):
		if(previous_index >= reusable_int):
			list_btn_second[previous_index - reusable_int].set_pressed(false)
			pre_avt_container = list_btn_second[previous_index - reusable_int].get_child(0)
			pre_avt_container.set("custom_styles/normal", background_btn_deactive)
			pre_avt_container.get_child(0).enable_playing(false)
		else:
			list_btn_first[previous_index].set_pressed(false)
			pre_avt_container = list_btn_first[previous_index].get_child(0)
			pre_avt_container.set("custom_styles/normal", background_btn_deactive)
			pre_avt_container.get_child(0).enable_playing(false)
			
	
	
	avatar.remove_child(avatar.get_child(0))
	reusable_avt = load(enemy_info.get("avatar")).instance()
	reusable_avt.adjust_scale(Vector2(1.5, 1.5))
	
	reusable_int = enemy_info.get("index")
	
	if(reusable_int in enemies_unlock):
		enemy_name.text = enemy_info.get("enemy_name")
		description.text = enemy_info.get("description")
		reusable_avt.set_is_unlock(true)
	else:
		enemy_name.text = "???"
		description.text = enemy_info.get("lock_message")
		reusable_avt.set_is_unlock(false)
	reusable_avt.enable_playing(true)
	avatar.add_child(reusable_avt)


func _on_button_pressed():
	reusable_int = 0
	for btn in list_btn_first:
		if btn.is_pressed():
			if(current_index != reusable_int):
				previous_index = current_index
				current_index = reusable_int
				emit_signal("button_click", reusable_int)
#				print("im come here for index: ", index)
#			break
		reusable_int = reusable_int + 1

	for btn in list_btn_second:
		if btn.is_pressed():
			if(current_index != reusable_int):
				previous_index = current_index
				current_index = reusable_int
				emit_signal("button_click", reusable_int)
#			break
		reusable_int = reusable_int + 1


func get_previous_index():
	reusable_int = 0
	for btn in list_btn_first:
		if btn.is_pressed() && reusable_int != 0:
			return reusable_int
		reusable_int = reusable_int + 1

	for btn in list_btn_second:
		if btn.is_pressed() :
			return reusable_int
		reusable_int = reusable_int + 1
	
	return -1
	
func on_season_pressed(season_name):
	current_index = 0
	previous_index = get_previous_index()
	list_btn_first[0].set_pressed(true)
	emit_signal("button_click", 0)
	set_season_style(season_name)

func get_enemies_unlock(season_key: String):
	enemies_unlock = User.data.completion.enemy.get(season_key)
	
func get_longest_run(season_key: String):
	longest_run.text = str(User.data.best_distance.get(season_key).value) + "m"
	
func _on_SpringButton_pressed():
	if(current_season != SEASON.SPRING):
		set_focus_enemies(spring_container, SEASON.SPRING, EnemySettings.spring_enemies)
		show_desired_season(true, false, false, false)
		current_season = SEASON.SPRING
		get_enemies_unlock("spring")
		get_longest_run("spring")

func _on_SummerButton_pressed():
	if(current_season != SEASON.SUMMER):
		set_focus_enemies(summer_container, SEASON.SUMMER, EnemySettings.summer_enemies)
		show_desired_season(false, true, false, false)
		current_season = SEASON.SUMMER
		get_enemies_unlock("summer")
		get_longest_run("summer")

func _on_AutumnButton_pressed():
	if(current_season != SEASON.AUTUMN):
		set_focus_enemies(autumn_container, SEASON.AUTUMN, EnemySettings.autumn_enemies)
		show_desired_season(false, false, true, false)
		current_season = SEASON.AUTUMN
		get_enemies_unlock("autumn")
		get_longest_run("autumn")
	
func _on_WinterButton_pressed():
	if(current_season != SEASON.WINTER):
		set_focus_enemies(winter_container, SEASON.WINTER, EnemySettings.winter_enemies)
		show_desired_season(false, false, false, true)
		current_season = SEASON.WINTER
		get_enemies_unlock("winter")
		get_longest_run("winter")

