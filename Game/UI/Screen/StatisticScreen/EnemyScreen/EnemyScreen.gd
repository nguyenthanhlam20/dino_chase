extends Popup

onready var spring_container = $Spring/VBoxContainer
onready var summer_container = $Summer/VBoxContainer
onready var autumn_container = $Autumn/VBoxContainer
onready var winter_container = $Winter/VBoxContainer

onready var enemy_name = $OuterBorder/Background/EnemyName
onready var enemy_background = $OuterBorder/Background
onready var description = $OuterBorder/Background/Description
onready var avatar = $OuterBorder/Background/CenterContainer/Avatar

onready var spring = $SeasonContainer/VBoxContainer/Spring
onready var summer = $SeasonContainer/VBoxContainer/Summer
onready var autumn = $SeasonContainer/VBoxContainer/Autumn
onready var winnter = $SeasonContainer/VBoxContainer/Winter

onready var longest_run = $LongestRun

onready var spring_background = $SeasonContainer/VBoxContainer/Spring/Background
onready var summer_background = $SeasonContainer/VBoxContainer/Summer/Background
onready var autumn_background = $SeasonContainer/VBoxContainer/Autumn/Background
onready var winnter_background = $SeasonContainer/VBoxContainer/Winter/Background
onready var root_node = self.get_parent()
onready var maps = MapSettings.maps
onready var map_unlock = User.data.completion.map
onready var map_btns_container = $SeasonContainer/VBoxContainer

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

signal button_click(index)

func hide_scrollbar():
	spring_container.get_parent().get_h_scrollbar().modulate.a = 0
	summer_container.get_parent().get_h_scrollbar().modulate.a = 0
	autumn_container.get_parent().get_h_scrollbar().modulate.a = 0
	winter_container.get_parent().get_h_scrollbar().modulate.a = 0
	
func _ready() -> void:
#	hide vertical scroll bar
	hide_scrollbar()
#	create default style box
	create_style_box()
#	generate seasons 
	generate_seasons()
	
	hide_season_btns()
	
	show_desired_season(true, false, false, false)
	
#	focus on spring enemies when first time user enter this screen
	set_focus_enemies("Spring", EnemySettings.spring_enemies)
	get_longest_run("spring")
func hide_season_btns():
	
	var index : int
	var map_btn : Label
	for map in maps:
		index = map.get("index")
		map_btn = map_btns_container.get_node(map.get("map_name"))
		if(index in map_unlock):
			map_btn.visible = true
		else:
			map_btn.visible = false
			
func show_desired_season(spring_visible, summer_visible, autumn_visible, winter_visible):
	var season = self.get_node("Spring")
	season.set("visible", spring_visible)
	
	season = self.get_node("Summer")
	season.set("visible", summer_visible)

	season = self.get_node("Autumn")
	season.set("visible", autumn_visible)
	
	season = self.get_node("Winter")
	season.set("visible", winter_visible)

func set_focus_enemies(season_name: String, enem):
	
	var season = self.get_node(season_name).get_child(0)
	var line_one = season.get_child(0)
	var line_two = season.get_child(1)
	
	list_btn_first = line_one.get_children()
	list_btn_second = line_two.get_children()
	
	
	enemies = enem
	on_season_pressed(season_name)
	

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
	var total = enem.size()
	var first_part = total / 2
#	var second_part = total - first_part
	
	var index = 0
	for enemy in enem: 
#		print("fail at index", index)
		create_label(enemy)
		index = index + 1
		if(index <= first_part):
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
	
	var avt = load(enemy.get("avatar")).instance()
	avt.adjust_scale(Vector2(0.7, 0.7))
	var enemy_index = enemy.get("index")
	if(enemy_index in enemies_unlock):
		avt.set_is_unlock(true)
	else:
		avt.set_is_unlock(false)
	avt.enable_playing(false)
	avt.set("position", Vector2(11, 11))
	label.add_child(avt)

			
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
		"Spring":
			background_season_active.set("bg_color", "81B622")
			spring.set("custom_styles/normal", border_season_active)
			spring_background.set("custom_styles/normal", background_season_active)
		"Summer":
			background_season_active.set("bg_color", "FAC12F")
			summer.set("custom_styles/normal", border_season_active)
			summer_background.set("custom_styles/normal", background_season_active)
		"Autumn":
			background_season_active.set("bg_color", "914110")
			autumn.set("custom_styles/normal", border_season_active)
			autumn_background.set("custom_styles/normal", background_season_active)
		"Winter":
			background_season_active.set("bg_color", "CADAE3")
			winnter.set("custom_styles/normal", border_season_active)
			winnter_background.set("custom_styles/normal", background_season_active)
			
func _on_Return_released():
	yield(get_tree().create_timer(0.2), "timeout")
	self.hide()
	root_node.show_button_group(true)
	root_node.enable_buttons()

func change_background_color(styled_node, color):
	styled_node.set("bg_color", color)

func _on_EnemyScreen_button_click(index):
	var enemy = enemies[index]
	var colo = enemy.get("color")
	var crt_avt_container
	var pre_avt_container 
	var crt_avt
	change_background_color(background_btn_active, colo)
	
	styled_background.set("bg_color", colo)
	enemy_background.set("custom_styles/normal", styled_background)
	
	var first_part = list_btn_first.size()
#	var second_part = list_btn_second.size() 
	if(index >= first_part):
		crt_avt_container = list_btn_second[index - first_part].get_child(0)
		crt_avt_container.set("custom_styles/normal", background_btn_active)
		crt_avt = crt_avt_container.get_child(0)
		crt_avt.enable_playing(true)
	else:
		crt_avt_container = list_btn_first[index].get_child(0)
		crt_avt_container.set("custom_styles/normal", background_btn_active)
		crt_avt = crt_avt_container.get_child(0)
		crt_avt.enable_playing(true)

	if(previous_index != -1):
		if(previous_index >= first_part):
			list_btn_second[previous_index - first_part].set_pressed(false)
			pre_avt_container = list_btn_second[previous_index - first_part].get_child(0)
			pre_avt_container.set("custom_styles/normal", background_btn_deactive)
			pre_avt_container.get_child(0).enable_playing(false)
		else:
			list_btn_first[previous_index].set_pressed(false)
			pre_avt_container = list_btn_first[previous_index].get_child(0)
			pre_avt_container.set("custom_styles/normal", background_btn_deactive)
			pre_avt_container.get_child(0).enable_playing(false)
			
	
	
	avatar.remove_child(avatar.get_child(0))
	var avt = load(enemy.get("avatar")).instance()
	avt.adjust_scale(Vector2(1.5, 1.5))
	var enemy_index = enemy.get("index")
	if(enemy_index in enemies_unlock):
		enemy_name.text = enemy.get("enemy_name")
		description.text = enemy.get("description")
		avt.set_is_unlock(true)
	else:
		enemy_name.text = "???"
		description.text = enemy.get("lock_message")
		avt.set_is_unlock(false)
	avt.enable_playing(true)
	avatar.add_child(avt)


func _on_button_pressed():
	var index = 0
	for btn in list_btn_first:
		if btn.is_pressed():
			if(current_index != index):
				previous_index = current_index
				current_index = index
				emit_signal("button_click", index)
#				print("im come here for index: ", index)
#			break
		index = index + 1

	for btn in list_btn_second:
		if btn.is_pressed():
			if(current_index != index):
				previous_index = current_index
				current_index = index
				emit_signal("button_click", index)
#			break
		index = index + 1


func get_previous_index():
	var index = 0
	for btn in list_btn_first:
		if btn.is_pressed() && index != 0:
			return index
		index = index + 1

	for btn in list_btn_second:
		if btn.is_pressed() :
			return index
		index = index + 1
	
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
		set_focus_enemies("Spring", EnemySettings.spring_enemies)
		show_desired_season(true, false, false, false)
		current_season = SEASON.SPRING
		get_enemies_unlock("spring")
		get_longest_run("spring")

func _on_SummerButton_pressed():
	if(current_season != SEASON.SUMMER):
		set_focus_enemies("Summer", EnemySettings.summer_enemies)
		show_desired_season(false, true, false, false)
		current_season = SEASON.SUMMER
		get_enemies_unlock("summer")
		get_longest_run("summer")

func _on_AutumnButton_pressed():
	if(current_season != SEASON.AUTUMN):
		set_focus_enemies("Autumn", EnemySettings.autumn_enemies)
		show_desired_season(false, false, true, false)
		current_season = SEASON.AUTUMN
		get_enemies_unlock("autumn")
		get_longest_run("autumn")
	
func _on_WinterButton_pressed():
	if(current_season != SEASON.WINTER):
		set_focus_enemies("Winter", EnemySettings.winter_enemies)
		show_desired_season(false, false, false, true)
		current_season = SEASON.WINTER
		get_enemies_unlock("winter")
		get_longest_run("winter")

