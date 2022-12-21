extends Control

onready var scroll_container = $ScrollContainer
onready var scroll_tween: Tween = Tween.new()
onready var margin_r: int = $ScrollContainer/CenterContainer/MarginContainer.get("custom_constants/margin_right")
onready var card_space: float = $ScrollContainer/CenterContainer/MarginContainer/HBoxContainer.get("custom_constants/separation")
onready var card_nodes: Array = $ScrollContainer/CenterContainer/MarginContainer/HBoxContainer.get_children()
onready var label = $Label
onready var back_btn = $Back
onready var choose_btn = $Choose
onready var map_name = $MapName
onready var map_unlock = User.data.completion.map
onready var coins = User.data.general.coins.value
onready var choose_btn_normal = load("res://Resource/Buttons/Choose-1.png")
onready var choose_btn_pressed = load("res://Resource/Buttons/Choose-2.png")
onready var question_mark = load("res://Resource/Buy/question_mark.png")

onready var card_container = $ScrollContainer/CenterContainer/MarginContainer/HBoxContainer
onready var maps = MapSettings.maps

export(int, 0.5, 1, 0.1) var card_scale = 1
export(float, 1, 1.5, 0.1) var card_current_scale = 1.3
export(float, 0.1, 1, 0.1) var scroll_duration = 1.3

var card_current_index: int = 0
var card_x_positions: Array = []
onready var cover_background = load(ScreenSettings.screens.get("COVER_BACKGROUND"))
onready var not_enough_screen = load(ScreenSettings.screens.get("NOT_ENOUGH_SCREEN"))
onready var confirm_screen = load(ScreenSettings.screens.get("CONFIRM_SCREEN"))


signal buy

func show_popup(value):
	self.visible = value


func _ready() -> void:
	get_tree().paused = false
	get_tree().set_current_scene(self)
	put_map()
	card_current_index = MapSettings.current_map_index
	map_name.texture = load(get_map_title(card_current_index))
	
#	print(card_current_index)
	scroll_container.add_child(scroll_tween)
	yield(get_tree(), "idle_frame")
	
	scroll_container.get_h_scrollbar().modulate.a = 0
	
	for _card in card_nodes:
		var _card_pos_x: float = (margin_r + _card.rect_position.x) - ((rect_size.x - _card.rect_size.x) / 2)
		_card.rect_pivot_offset = (_card.rect_size / 2)
		card_x_positions.append(_card_pos_x)
		
	scroll_container.scroll_horizontal = card_x_positions[card_current_index]
	scroll()
	

	
func put_map():
	for map in maps:
		var map_texture_container = card_container.get_node(map.get("map_name")).get_child(0)
		if(map.get("index") in map_unlock):
			map_texture_container.texture = load(map.get("map_unlock"))
		else:
			map_texture_container.texture = load(map.get("map_lock"))



func _process(_delta: float) -> void:
	for _index in range(card_x_positions.size()):
		var _card_pos_x: float = card_x_positions[_index]
		var _swipe_length = (card_nodes[_index].rect_size.x / 2) + (card_space / 2)
		var _swipe_current_length: float = abs(_card_pos_x - scroll_container.scroll_horizontal)
		var _card_scale: float = range_lerp(_swipe_current_length, _swipe_length, 0, card_scale, card_current_scale)
		var _card_opacity: float = range_lerp(_swipe_current_length, _swipe_length, 0, 1, 1)
		
		_card_scale = clamp(_card_scale, card_scale, card_current_scale)
		_card_opacity = clamp(_card_opacity, 1, 1)
		
		card_nodes[_index].rect_scale = Vector2(_card_scale, _card_scale)
		card_nodes[_index].modulate.a = _card_opacity
		
		if _swipe_current_length < _swipe_length:
			card_current_index = _index
	

func scroll() -> void:
#	print("is scroll")
	print('scroll_tween: ', scroll_tween.interpolate_property(
		scroll_container,
		"scroll_horizontal",
		scroll_container.scroll_horizontal,
		card_x_positions[card_current_index],
		scroll_duration,
		Tween.TRANS_BACK,
		Tween.EASE_OUT))
	
	for _index in range(card_nodes.size()):
		var _card_scale: float = card_current_scale if _index == card_current_index else card_scale
		print('interpolate_property: ', scroll_tween.interpolate_property(
			card_nodes[_index],
			"rect_scale",
			card_nodes[_index].rect_scale,
			Vector2(_card_scale,_card_scale),
			scroll_duration,
			Tween.TRANS_QUAD,
			Tween.EASE_OUT))
#		yield(get_tree().create_timer(0.1), "timeout")

	if(card_current_index in map_unlock):
		choose_btn.normal = choose_btn_normal
		choose_btn.pressed = choose_btn_pressed
		map_name.texture = load(get_map_title(card_current_index))
		if(!choose_btn.is_connected("released", self, "_on_Choose_released")):
			choose_btn.connect("released", self, "_on_Choose_released")
		if(choose_btn.is_connected("released", self, "_on_MapScreen_buy")):
			choose_btn.disconnect("released", self, "_on_MapScreen_buy")
	else:
		map_name.texture = question_mark
		choose_btn.normal = load(maps[card_current_index].get("buy_btn_normal"))
		choose_btn.pressed = load(maps[card_current_index].get("buy_btn_pressed"))
		
		
		if(!choose_btn.is_connected("released", self, "_on_MapScreen_buy")):
			choose_btn.connect("released", self, "_on_MapScreen_buy")
		if(choose_btn.is_connected("released", self, "_on_Choose_released")):
			choose_btn.disconnect("released", self, "_on_Choose_released")

		
	print('scroll tween start: ', scroll_tween.start())


func _on_ScrollContainer_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			print("stop all in map screen: ", scroll_tween.stop_all())
		else:
			scroll()


func get_map_title(index):
	return MapSettings.maps[index].get("map_title")
			
func get_map_name(index):
	return MapSettings.maps[index].get("map_name")


func disable_buttons():
	back_btn.disconnect("released", self, "_on_Back_released")
	choose_btn.disconnect("released", self, "_on_Choose_released")


func _on_Back_released():
	disable_buttons()
	yield(get_tree().create_timer(0.2), "timeout")
	SceneTransition.change_scene(self, "res://Game/UI/Screen/CharacterScreen/CharacterScreen.tscn")
	
func _on_Choose_released():
	disable_buttons()
	yield(get_tree().create_timer(0.2), "timeout")
	SceneTransition.change_scene(self, "res://Game/UI/Screen/CharacterScreen/CharacterScreen.tscn")
	MapSettings.current_map_index = card_current_index
	EnemyFactory.set_enemies()
	GameSettings.save_settings_data()


func _on_MapScreen_buy():
	get_tree().paused = true
	var map_price = maps[card_current_index].get("price")
	if(coins > map_price): 
		if(!self.has_node("ConfirmScreen")):
			var cover_background_instance = cover_background.instance()
			self.add_child(cover_background_instance)
			
			var confirm_screen_instance = confirm_screen.instance()
			confirm_screen_instance.set_root_node(self)
			confirm_screen_instance.set_item(card_current_index, map_price, "map")
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

func add_new_child(new_child: Popup):
	self.add_child(new_child)
	new_child.show_popup()
