extends Control

onready var scroll_container = $ScrollContainer
onready var scroll_tween: Tween = Tween.new()
onready var margin_r: int = $ScrollContainer/CenterContainer/MarginContainer.get("custom_constants/margin_right")
onready var card_space: float = $ScrollContainer/CenterContainer/MarginContainer/HBoxContainer.get("custom_constants/separation")
onready var card_nodes: Array = $ScrollContainer/CenterContainer/MarginContainer/HBoxContainer.get_children()
onready var label = $Label
onready var back_btn = $Back
onready var choose_btn = $Choose
onready var parallax = $ParallaxLinear
onready var map_name = $MapName

export(int, 0.5, 1, 0.1) var card_scale = 1
export(float, 1, 1.5, 0.1) var card_current_scale = 1.3
export(float, 0.1, 1, 0.1) var scroll_duration = 1.3

var card_current_index: int = 0
var card_x_positions: Array = []


func disable_buttons():
	back_btn.disconnect("released", self, "_on_Back_released")
	choose_btn.disconnect("released", self, "_on_Choose_released")

func show_popup(value):
	self.visible = value


func _ready() -> void:
	parallax.start = true
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
	yield(get_tree().create_timer(1), "timeout")



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
	map_name.texture = load(get_map_title(card_current_index))
#	label.text = get_map_name(card_current_index)
	print('scroll tween start: ', scroll_tween.start())


func _on_ScrollContainer_gui_input(event: InputEvent) -> void:
#	print("go here", event)
	if event is InputEventMouseButton:
		if event.pressed:
			print("stop all in map screen: ", scroll_tween.stop_all())
#			print("stop")
		else:
#			print("scroll")
			scroll()


func get_map_title(index):
	return MapSettings.maps[index].get("map_title")
			
func get_map_name(index):
	return MapSettings.maps[index].get("map_name")


func _on_Back_released():
	disable_buttons()
	yield(get_tree().create_timer(0.2), "timeout")
	SceneTransition.change_scene("res://Game/UI/Screen/CharacterScreen/CharacterScreen.tscn")
	
func _on_Choose_released():
	disable_buttons()
	yield(get_tree().create_timer(0.2), "timeout")
	SceneTransition.change_scene("res://Game/UI/Screen/CharacterScreen/CharacterScreen.tscn")
	MapSettings.current_map_index = card_current_index
	GameSettings.save_settings_data()
