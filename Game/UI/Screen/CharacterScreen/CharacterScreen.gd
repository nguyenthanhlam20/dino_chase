extends Control

onready var character_name = $MainContent/BorderColor/GridContainer/ColorText/Container/CharacterName
onready var character_detail = $MainContent/BorderColor/GridContainer/ColorText/Container/CharacterDetail
onready var character_container =  $MainContent/BorderColor/GridContainer/ColorCharacter/CenterContainer/CharacterContainer
onready var color_character = $MainContent/BorderColor/GridContainer/ColorCharacter
onready var color_text = $MainContent/BorderColor/GridContainer/ColorText
onready var main_content = $MainContent
onready var parallax = $ParallaxCirle
onready var player_navigation = $MainContent/PlayerNavigation

onready var play_btn = $MainContent/Buttons/Play
onready var back_btn = $MainContent/Buttons/Back
onready var map_btn = $MainContent/Buttons/Map

onready var bar_nomal = load("res://Resource/Buttons/Play-1-v2.png")
onready var bar_pressed = load("res://Resource/Buttons/Play-2.png")

var style_box_flat = StyleBoxFlat.new()
var background_btn_active = StyleBoxFlat.new()
var background_btn_deactive = StyleBoxFlat.new()
var border_btn_active = StyleBoxFlat.new()
var border_btn_deactive = StyleBoxFlat.new()
var label : Label
var button : Button
var sprite : Sprite

var player_info
var buttons_in_navigation : Array
var character_unlock : Array

var current_index = 0


func disable_buttons():
	back_btn.disconnect("released", self, "_on_Back_released")
	play_btn.disconnect("released", self, "_on_Play_released")
	map_btn.disconnect("released", self, "_on_Map_released")
	
func enable_buttons():
	back_btn.disconnect("released", self, "_on_Back_released")
	play_btn.disconnect("released", self, "_on_Play_released")
	map_btn.disconnect("released", self, "_on_Map_released")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	character_unlock = User.data.completion.character
	create_style_box()
	add_style_box()
	generate_buttons()
	buttons_in_navigation = player_navigation.get_children()
	set_player_info(PlayerSettings.current_player_index)
	current_index =  player_info.get("index");
	parallax.start_moving(true)

func change_background_color(styled_node, color):
	styled_node.set("bg_color",color)

func generate_buttons():
	for player in PlayerSettings.players:
		create_label(player)
		create_btn()

func create_label(player) -> void:
	label = Label.new()
	label.set("margin_left", 1)
	label.set("margin_top", 1)
	label.set("margin_right", -1)
	label.set("margin_bottom", -1)
	label.set("rect_min_size", Vector2(20, 20))
	label.set("custom_styles/normal", background_btn_deactive)
	
	sprite = Sprite.new()
	sprite.set("position", Vector2(10, 10))
	sprite.set("scale", Vector2(0.8, 0.8))
	
	var player_index = player.get("index");
	var avt_path : String
	
	if(player_index in character_unlock):
		avt_path = player.get("unlock")
	else:
		avt_path = player.get("lock")

	sprite.texture = load(avt_path)
#	avt.set("scale", Vector2(0.7, 0.7))
#	avt.set("position", Vector2(11, 11))

	label.add_child(sprite)

			
func create_btn():
	button = Button.new()
	if(button.connect("pressed", self, "_on_player_navigation_pressed")):
		pass
	button.set("rect_min_size", Vector2(22, 22))
	button.set("custom_styles/hover", border_btn_deactive)
	button.set("custom_styles/pressed", border_btn_active)
	button.set("custom_styles/focus", border_btn_active)
	button.set("custom_styles/disabled", border_btn_deactive)
	button.set("custom_styles/normal", border_btn_deactive)
	button.set("toggle_mode", true)
	button.add_child(label)
	player_navigation.add_child(button)
		

func set_style_box_flat(top_left_radius, 
		top_right_radius, bottom_left_radius,
		bottom_right_radius, color):
	style_box_flat.corner_radius_top_left = top_left_radius
	style_box_flat.corner_radius_top_right = top_right_radius
	style_box_flat.corner_radius_bottom_left = bottom_left_radius
	style_box_flat.corner_radius_bottom_right = bottom_right_radius
	style_box_flat.bg_color = color
	
func create_style_box():
	set_style(background_btn_active, "ffffff", 4)
	set_style(background_btn_deactive, "404040", 4)
	set_style(border_btn_active, "ffffff", 5)
	set_style(border_btn_deactive, "000000", 5)

func add_style_box():
	for btn in buttons_in_navigation: 
		btn.set("custom_styles/hover", border_btn_deactive)
		btn.set("custom_styles/pressed", background_btn_active)
		btn.set("custom_styles/focus", background_btn_active)
		btn.set("custom_styles/disabled", border_btn_deactive)
		btn.set("custom_styles/normal", border_btn_deactive)
		btn.get_child(0).set("custom_styles/normal", background_btn_deactive)
	
func set_style(styled_node, color, border_radius):
	styled_node.set("bg_color",color)
	styled_node.set("corner_radius_top_left", border_radius)
	styled_node.set("corner_radius_top_right", border_radius)
	styled_node.set("corner_radius_bottom_right", border_radius)
	styled_node.set("corner_radius_bottom_left",border_radius)

func change_button_status(index, style, pressed):
	var btn = buttons_in_navigation[index];
	var btn_background = btn.get_child(0);
	btn_background.set("custom_styles/normal", style)
	btn.set_pressed(pressed)
	
func set_player_info(index : int):
	player_info = PlayerSettings.players[index]
	var color = player_info.get("color")
	var is_unlock = index in character_unlock
	
	change_button_status(current_index, background_btn_deactive, false)
	
	buttons_in_navigation[index].set_pressed(true)
	
	current_index = index 
	if(is_unlock):
		PlayerSettings.current_player_index = index
		set_style_box_flat(9, 0, 9, 0, color)
		character_name.text = player_info.get("character_name")
		character_detail.text = player_info.get("character_detail")
		play_btn.normal = bar_nomal
		play_btn.pressed = bar_pressed
	else:
		set_style_box_flat(9, 0, 9, 0, "#fff")
		character_name.text = "???"
		character_detail.text = "???"
		var unlock_at_button = player_info.get("unlock_at_button")
		play_btn.normal = load(unlock_at_button)
		play_btn.pressed = load(unlock_at_button)
		
	color_character.set("custom_styles/normal", style_box_flat)
	change_background_color(background_btn_active, color)
	
	var avatar = PlayerSettings.get_current_avatar()
	
	change_button_status(current_index, background_btn_active, true)

	
	if(character_container.get_child_count() > 0):
		var current_avatar = character_container.get_child(character_container.get_child_count() - 1)
		character_container.remove_child(current_avatar)
		avatar.scale.x = 1.5
		avatar.scale.y = 1.5
		if(is_unlock):
			avatar.set_current_state("UNLOCK")
		else:
			avatar.set_current_state("LOCK")
		
#		print(avatar.name)
		character_container.add_child(avatar)

func _on_player_navigation_pressed():
	var index = 0
	for btn in player_navigation.get_children():
		if(btn.is_pressed()):
			if(current_index != index):
				set_player_info(index)
		index = index + 1
		
func _on_Back_released():
	disable_buttons()
	yield(get_tree().create_timer(0.2), "timeout")
	SceneTransition.change_scene(self, "res://Game/UI/Screen/HomeScreen/HomeScreen.tscn")
	
func _on_Play_released():
	var is_unlock = current_index in character_unlock
	if(is_unlock):
		disable_buttons()
		yield(get_tree().create_timer(0.2), "timeout")
		SceneTransition.change_scene(self,"res://Game/World/World.tscn")
		GameSettings.save_settings_data()

func _on_Map_released():
	disable_buttons()
	yield(get_tree().create_timer(0.2), "timeout")
	SceneTransition.change_scene(self,"res://Game/UI/Screen/MapScreen/MapScreen.tscn")
	


