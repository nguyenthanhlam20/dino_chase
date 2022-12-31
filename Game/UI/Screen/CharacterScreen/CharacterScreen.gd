extends Control

onready var character_name = $MainContent/BorderColor/GridContainer/ColorText/Container/CharacterName
onready var character_detail = $MainContent/BorderColor/GridContainer/ColorText/Container/CharacterDetail
onready var character_avatar = $MainContent/BorderColor/GridContainer/ColorCharacter/CenterContainer/CharacterContainer/Avatar
onready var color_character = $MainContent/BorderColor/GridContainer/ColorCharacter
onready var color_text = $MainContent/BorderColor/GridContainer/ColorText
onready var main_content = $MainContent
onready var player_navigation = $MainContent/CenterPosition/PlayerNavigation

onready var play_btn = $MainContent/BottomPosition/Play
onready var back_btn = $MainContent/Back
onready var map_btn = $MainContent/TopRightPosition/Map

onready var cover_background = load(Constants.COVER_BACKGROUND)
onready var not_enough_screen = load(Constants.NOT_ENOUGH_SCREEN)
onready var confirm_screen = load(Constants.CONFIRM_SCREEN)

onready var bar_nomal = load(Constants.PLAY_BUTTON_NORMAL)
onready var bar_pressed = load(Constants.PLAY_BUTTON_PRESSED)

var reusable_ins 

var btn_buy_normal : String
var btn_buy_pressed : String

var style_box_flat = StyleBoxFlat.new()
var background_btn_active = StyleBoxFlat.new()
var background_btn_deactive = StyleBoxFlat.new()
var border_btn_active = StyleBoxFlat.new()
var border_btn_deactive = StyleBoxFlat.new()
var label : Label
var button : Button
var sprite : Sprite

var player_info
var player_color : String
var total_coins : int
var player_price : int
var player_avatar : KinematicBody2D
var buttons_in_navigation : Array
var character_unlock : Array
var current_index = 0
var avt_path : String
var reusable_int : int = 0
var reusable_bool : bool

func disable_buttons():
	if(back_btn.is_connected("released", self, "_on_Back_released")):
		back_btn.disconnect("released", self, "_on_Back_released")
		
	if(play_btn.is_connected("released", self, "_on_CharacterScreen_buy")):
		play_btn.disconnect("released", self, "_on_CharacterScreen_buy")

	if(map_btn.is_connected("released", self, "_on_Map_released")):
		map_btn.disconnect("released", self, "_on_Map_released")
	
func enable_buttons():
	if(!back_btn.is_connected("released", self, "_on_Back_released")):
		back_btn.connect("released", self, "_on_Back_released")
		
	if(!play_btn.is_connected("released", self, "_on_CharacterScreen_buy")):
		play_btn.connect("released", self, "_on_CharacterScreen_buy")
	
	if(!map_btn.is_connected("released", self, "_on_Map_released")):
		map_btn.connect("released", self, "_on_Map_released")
	
func _ready():
	get_tree().set_current_scene(self)
	character_unlock = User.data.completion.character
	create_style_box()
	add_style_box()
	generate_buttons()
	buttons_in_navigation = player_navigation.get_children()
	set_player_info(PlayerSettings.current_player)
	current_index =  player_info.get("index");


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
	
	reusable_int = player.get("index");

	if(reusable_int in character_unlock):
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
	player_info = PlayerSettings.get_player(index)
	
	character_avatar.set_player_avatar(player_info.get("frame"))
	player_color = player_info.get("color") 
	reusable_bool = index in character_unlock
	change_button_status(current_index, background_btn_deactive, false)
	
	buttons_in_navigation[index].set_pressed(true)
	
	current_index = index 
	set_style_box_flat(9, 0, 9, 0, player_color)
	if(reusable_bool):
		character_avatar.set_current_state(1)
		PlayerSettings.current_player = index
		character_name.text = player_info.get("character_name")
		character_detail.text = player_info.get("character_detail")
		play_btn.normal = bar_nomal
		play_btn.pressed = bar_pressed
		if(play_btn.is_connected("released", self, "_on_CharacterScreen_buy")):
			play_btn.disconnect("released", self, "_on_CharacterScreen_buy")
		if(!play_btn.is_connected("released", self, "_on_Play_released")):
			play_btn.connect("released", self, "_on_Play_released")
	else:
		character_avatar.set_current_state(0)
		character_name.text = "???"
		character_detail.text = "???"
		btn_buy_normal = player_info.get("buy_btn_normal")
		btn_buy_pressed = player_info.get("buy_btn_pressed")
		play_btn.normal = load(btn_buy_normal)
		play_btn.pressed = load(btn_buy_pressed)
		if(!play_btn.is_connected("released", self, "_on_CharacterScreen_buy")):
			play_btn.connect("released", self, "_on_CharacterScreen_buy")
		if(play_btn.is_connected("released", self, "_on_Play_released")):
			play_btn.disconnect("released", self, "_on_Play_released")
		
		
	color_character.set("custom_styles/normal", style_box_flat)
	change_background_color(background_btn_active, player_color)
	

	
	change_button_status(current_index, background_btn_active, true)

func _on_player_navigation_pressed():
	reusable_int = 0
	for btn in player_navigation.get_children():
		if(btn.is_pressed()):
			if(current_index != reusable_int):
				set_player_info(reusable_int)
		reusable_int = reusable_int + 1
		
func _on_Back_released():
	disable_buttons()
	yield(get_tree().create_timer(0.1), "timeout")
	SceneTransition.change_scene(self, Constants.HOME_SCREEN)
	
func _on_Play_released():
	disable_buttons()
	yield(get_tree().create_timer(0.1), "timeout")
	SceneTransition.change_scene(self, Constants.WORLD_SCREEN)
	GameSettings.save_settings_data()
		

func _on_Map_released():
	disable_buttons()
	yield(get_tree().create_timer(0.1), "timeout")
	SceneTransition.change_scene(self, Constants.MAP_SCREEN)



func _on_CharacterScreen_buy():
	disable_buttons()
	get_tree().paused = true
	total_coins = User.get_user_info("general", "coins")
	player_price = player_info.get("price")
	if(total_coins >= player_price): 
		if(!self.has_node("ConfirmScreen")):
			var cover_background_instance = cover_background.instance()
			self.add_child(cover_background_instance)
			
			var confirm_screen_instance = confirm_screen.instance()
			confirm_screen_instance.set_root_node(self)
			confirm_screen_instance.set_item(current_index, player_price, "character")
			self.add_child(confirm_screen_instance)
			confirm_screen_instance.show_popup()
	else: 
		if(!self.has_node("NotEnoughScreen")):
			var cover_background_instance = cover_background.instance()
			var not_enough_instance = not_enough_screen.instance()
			self.add_child(cover_background_instance)
			not_enough_instance.set_root_node(self)
			self.add_child(not_enough_instance)
			not_enough_instance.show_popup()
		
func clear_cover_background():
	get_tree().paused = false
	self.remove_child(self.get_node("CoverBackground"))

func add_new_child(new_child : Popup):
	self.add_child(new_child)
	new_child.show_popup()
		
