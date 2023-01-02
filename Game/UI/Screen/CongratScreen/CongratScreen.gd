extends Popup

var root_node setget set_root_node

func set_root_node(value) -> void:
	root_node = value

func _ready():
	root_node.disable_buttons()


func set_item(item_type: String, title_value : String, avatar_value : String, name_value : String, item_color: Color):
	print(title_value, avatar_value, name_value)
	$BackgroundColor.color = item_color
	$GridContainer/Title.text = title_value
	
	if(item_type == "character"):
		$GridContainer/ItemAvatar/Sprite.visible = false
		$GridContainer/ItemAvatar/Avatar.set_player_avatar(avatar_value)
		$GridContainer/ItemAvatar/Avatar.set_current_state(1)
	else:
		$GridContainer/ItemAvatar/Avatar.visible = false
		$GridContainer/ItemAvatar/Avatar.pause_mode = PAUSE_MODE_STOP
		$GridContainer/ItemAvatar/Sprite.texture = load(avatar_value)
		$GridContainer/ItemAvatar/Sprite.position = Vector2(64, 0)
		$GridContainer/ItemAvatar/Sprite.visible = true
	
	$GridContainer/ItemName.text = name_value

	
func show_popup():
	self.show()
	
func _on_OK_released():
	if(get_tree().reload_current_scene()):
		pass
	
