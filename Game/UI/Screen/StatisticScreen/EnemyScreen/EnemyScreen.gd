extends Popup

onready var scroll_container = $ScrollContainer
onready var enemy_container = $ScrollContainer/VBoxContainer
onready var enemy_name = $OuterBorder/Background/EnemyName
onready var enemy_background = $OuterBorder/Background
onready var description = $OuterBorder/Background/Description
onready var avatar = $OuterBorder/Background/CenterContainer/Avatar
onready var season_icon = $SeasonIcon

onready var spring = $SeasonContainer/VBoxContainer/Spring
onready var summer = $SeasonContainer/VBoxContainer/Summer
onready var autumn = $SeasonContainer/VBoxContainer/Autumn
onready var winnter = $SeasonContainer/VBoxContainer/Winter

onready var spring_background = $SeasonContainer/VBoxContainer/Spring/Background
onready var summer_background = $SeasonContainer/VBoxContainer/Summer/Background
onready var autumn_background = $SeasonContainer/VBoxContainer/Autumn/Background
onready var winnter_background = $SeasonContainer/VBoxContainer/Winter/Background
onready var root_node = self.get_parent()

var enemies = []

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

var current_season_index = 0

var is_first_time = true

signal button_click(index)

func _ready() -> void:
	scroll_container.get_h_scrollbar().modulate.a = 0
	create_style_box()
	generate_everything(EnemySettings.spring_enemies)
	$ScrollContainer/VBoxContainer.set("mouse_filter", Control.MOUSE_FILTER_PASS)
	
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

func generate_container():
	first_line = HBoxContainer.new()
	second_line = HBoxContainer.new()
	
	first_line.set("mouse_filter", Control.MOUSE_FILTER_PASS)
	second_line.set("mouse_filter", Control.MOUSE_FILTER_PASS)
	
	first_line.set("custom_constants/separation", 3)
	second_line.set("custom_constants/separation", 3)
	enemy_container.add_child(first_line)
	enemy_container.add_child(second_line)

func generate_enemy() -> void:
	var total = enemies.size()
	var first_part = total / 2
#	var second_part = total - first_part
	
	var index = 0
	for enemy in enemies: 
		print("fail at index", index)
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
	avt.enable_playing(false)
	avt.set("position", Vector2(11, 11))
	label.add_child(avt)

			
func create_btn(container : HBoxContainer):
	button = Button.new()
	button.connect("pressed", self, "_on_button_pressed")
	button.set("mouse_filter", Control.MOUSE_FILTER_PASS)
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
			season_icon.texture = load(MapSettings.maps[0].get("map_icon"))
		"Summer":
			background_season_active.set("bg_color", "FAC12F")
			summer.set("custom_styles/normal", border_season_active)
			summer_background.set("custom_styles/normal", background_season_active)
			season_icon.texture = load(MapSettings.maps[1].get("map_icon"))
		"Autumn":
			background_season_active.set("bg_color", "914110")
			autumn.set("custom_styles/normal", border_season_active)
			autumn_background.set("custom_styles/normal", background_season_active)
			season_icon.texture = load(MapSettings.maps[2].get("map_icon"))
		"Winter":
			background_season_active.set("bg_color", "CADAE3")
			winnter.set("custom_styles/normal", border_season_active)
			winnter_background.set("custom_styles/normal", background_season_active)
			season_icon.texture = load(MapSettings.maps[3].get("map_icon"))
			
func _on_Return_released():
	yield(get_tree().create_timer(0.2), "timeout")
	self.hide()
	root_node.show_button_group(true)
	root_node.enable_buttons()

func change_background_color(styled_node, color):
	styled_node.set("bg_color", color)

func _on_EnemyScreen_button_click(index):
	var enemy = enemies[index]
	var colo = Color(randf(), randf(), randf())
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
			
	
	
	enemy_name.text = enemy.get("enemy_name")
	description.text = enemy.get("description")
	avatar.remove_child(avatar.get_child(0))
	var avt = load(enemy.get("avatar")).instance()
	avatar.add_child(avt)
	avt.adjust_scale(Vector2(1.5, 1.5))
	avt.enable_playing(true)


func _on_button_pressed():
	if(is_first_time && current_index == 0):
		list_btn_first[0].set_pressed(false)
		list_btn_first[0].get_child(0).set("custom_styles/normal", background_btn_deactive)
		is_first_time = false
	var index = 0
	for btn in list_btn_first:
		if btn.is_pressed():
			if(current_index != index):
				previous_index = current_index
				current_index = index
				emit_signal("button_click", index)
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

	
func generate_everything(enem):
	enemies = enem
	previous_index = -1
	current_index = 0
	generate_container()
	generate_enemy()
	set_season_style("Spring")
	list_btn_first = first_line.get_children()
	list_btn_second = second_line.get_children()
	list_btn_first[0].set_pressed(true)
	emit_signal("button_click", 0)
	

func on_season_pressed(season_index, season_enemies, season_name):
	if(current_season_index != season_index):
		first_line.queue_free()
		second_line.queue_free()
		generate_everything(season_enemies)
		set_season_style(season_name)
		current_season_index = season_index

func _on_SpringButton_pressed():
	on_season_pressed(0, EnemySettings.spring_enemies, "Spring")

func _on_SummerButton_pressed():
	on_season_pressed(1, EnemySettings.summer_enemies, "Summer")

func _on_AutumnButton_pressed():
	on_season_pressed(2, EnemySettings.autumn_enemies, "Autumn")
	
func _on_WinterButton_pressed():
	on_season_pressed(3, EnemySettings.winter_enemies, "Winter")

