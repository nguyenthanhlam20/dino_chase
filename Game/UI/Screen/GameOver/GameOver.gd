extends Popup

export var menu_size = 1
export var lerp_speed = 0.3

var _popped_up = false
var _up_anchor = Vector2(1-menu_size,1)
var _down_anchor = Vector2(1,1+menu_size)
var _target_anchor = _down_anchor


onready var home_btn = $CenterBottomPosition/Home
onready var play_again_btn = $CenterBottomPosition/PlayAgain
onready var miles_label = $VBoxContainer/Miles
onready var message_label = $VBoxContainer/Message
onready var coin_label = $ColorRect/CenterContainer/GridContainer/CoinContainer/CoinValue
onready var time_label = $ColorRect/CenterContainer/GridContainer/TimeContainer/TimeValue
onready var longest_run_label = $ColorRect/CenterContainer/GridContainer/LRunContainer/LongestRunValue

var root_node setget set_root_node
func set_root_node(value):
	root_node = value

func show_result(player):
	var message = Common.get_random_message()
	miles_label.text = str(player.miles) + "m"
	message_label.text = message
	longest_run_label.text = str(player.longest_distance) + "m"
	coin_label.text = "+" + str(player.coin)
	time_label.text = player.get_play_time()

# Called every frame. 'delta' is the elapsed time since the previous frame.
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
		
		
func disable_buttons():
	home_btn.disconnect("released", self, "_on_Home_released")
	play_again_btn.disconnect("released", self, "_on_PlayAgain_released")

	
func enable_buttons():
	home_btn.disconnect("released", self, "_on_Home_released")
	play_again_btn.disconnect("released", self, "_on_PlayAgain_released")

func _on_Home_released():
	disable_buttons()
	yield(get_tree().create_timer(0.1), "timeout")
	Common.paused_game(false)
	root_node.pause_mode = PAUSE_MODE_STOP
	SceneTransition.change_scene(root_node, Constants.HOME_SCREEN)
	self.queue_free()

func _on_PlayAgain_released():
	disable_buttons()
	yield(get_tree().create_timer(0.1), "timeout")
	var count_down_screen = load(Constants.COUNTDOWN_SCREEN).instance()
	root_node.add_child(count_down_screen)
	root_node.remove_background()
	count_down_screen.set_root_node(root_node)
	count_down_screen.set_is_reload(true)
	count_down_screen.start_count_down()
	self.queue_free()
