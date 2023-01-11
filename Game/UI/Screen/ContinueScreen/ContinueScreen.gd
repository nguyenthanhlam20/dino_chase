extends Popup

onready var congrat_screen = load(Constants.CONGRAT_SCREEN)

export var menu_size = 1
export var lerp_speed = 0.2

var _popped_up = false
var _up_anchor = Vector2(1-menu_size,1)
var _down_anchor = Vector2(1,1+menu_size)
var _target_anchor = _up_anchor

var root_node setget set_root_node
var is_restart : bool = false  setget set_is_restart


func set_is_restart(value: bool) -> void:
	is_restart = value
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


func _on_NO_released():
	root_node.enable_buttons()
	root_node.show_btns(true)
	self.queue_free()

func _on_YES_released():
	if(is_restart):
		root_node.count_down_settings(true)
	else:
		root_node.go_to_home()
	self.queue_free()
