extends Popup


func set_item(item_type: String, title_value : String, avatar_value : String, name_value : String, item_color: Color):
	
	print(title_value, avatar_value, name_value)
	$BackgroundColor.color = item_color
	$GridContainer/Title.text = title_value
	
	var avatar_instance
	if(item_type == "character"):
		$GridContainer/ItemAvatar/Sprite.visible = false
		avatar_instance = load(avatar_value).instance()
		avatar_instance.position = Vector2(64, 0)
		avatar_instance.scale = Vector2(3, 3)
		avatar_instance.set_current_state("IDLE")
		$GridContainer/ItemAvatar.add_child(avatar_instance)
	else:
		
		avatar_instance = load(avatar_value)
		$GridContainer/ItemAvatar/Sprite.texture = avatar_instance
		$GridContainer/ItemAvatar/Sprite.position = Vector2(64, 0)
		$GridContainer/ItemAvatar/Sprite.visible = true
	


	$GridContainer/ItemName.text = name_value

	
func show_popup():
	self.show()
	
func _on_OK_released():
	get_tree().reload_current_scene()
	
