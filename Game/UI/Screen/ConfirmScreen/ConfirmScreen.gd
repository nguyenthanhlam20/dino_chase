extends Popup

onready var congrat_screen = load(Constants.CONGRAT_SCREEN)

export var menu_size = 1
export var lerp_speed = 0.2

var _popped_up = false
var _up_anchor = Vector2(1-menu_size,1)
var _down_anchor = Vector2(1,1+menu_size)
var _target_anchor = _up_anchor

var root_node setget set_root_node

var item_index : int
var item_type : String
var item_price : int
var item_info : Dictionary

func set_root_node(value):
	root_node = value
	
func set_item(index_value : int, price_value : int, type_value: String) -> void:
	item_index = index_value
	item_type = type_value
	item_price = price_value

func _process(_delta):
	self.anchor_top = lerp(self.anchor_top,_target_anchor.x,lerp_speed)
	self.anchor_bottom = lerp(self.anchor_bottom,_target_anchor.y,lerp_speed)
	
func show_popup():
	if !_popped_up:
		_target_anchor = _up_anchor
	else:
		_target_anchor = _down_anchor
	
	_popped_up = !_popped_up
	if(_popped_up):
		self.show()


func _on_NO_released():
	root_node.clear_cover_background()
	root_node.enable_buttons()
	self.queue_free()

func _on_YES_released():
	var congrat_screen_instance = congrat_screen.instance()
	if(item_type == "character"):
		PlayerSettings.current_player = item_index
		item_info = PlayerSettings.get_player(item_index)
		User.data.completion.character.append(item_index)
		User.data.general.coins.value -= item_price
		congrat_screen_instance.set_item("character", 
			"new character unlock", 
			item_info.get("frame"), 
			item_info.get("character_name"),
			item_info.get("color"))
	else:
		MapSettings.current_map = item_index
		item_info = MapSettings.get_map(item_index)
		User.data.completion.map.append(item_index)
		User.data.general.coins.value -= item_price
		congrat_screen_instance.set_item("map",
			"new map unlock", 
			item_info.get("map_unlock"), 
			item_info.get("map_name"),
			item_info.get("color"))
	User.save_user_data()
	congrat_screen_instance.set_root_node(root_node)
	root_node.add_new_child(congrat_screen_instance)
	root_node.clear_cover_background()
	self.queue_free()
