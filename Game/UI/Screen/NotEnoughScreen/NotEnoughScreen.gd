extends Popup

export var menu_size = 1
export var lerp_speed = 0.2

var _popped_up = false
var _up_anchor = Vector2(1-menu_size,1)
var _down_anchor = Vector2(1,1+menu_size)
var _target_anchor = _up_anchor

var root_node setget set_root_node

func set_root_node(value):
	root_node = value


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

func _on_OK_released():
	root_node.clear_cover_background()
	self.queue_free()
