extends Popup

export var menu_size = 1
export var lerp_speed = 0.2

var _popped_up = false
var _up_anchor = Vector2(1-menu_size,1)
var _down_anchor = Vector2(1,1+menu_size)
var _target_anchor = _down_anchor


onready var message_label = $VBoxContainer/Message
onready var miles_label = $VBoxContainer/Miles
onready var longest_run_label = $ColorRect/CenterContainer/GridContainer/LRunContainer/LongestRunValue
onready var score_label = $ColorRect/CenterContainer/GridContainer/ScoreContainer/ScoreValue
onready var highest_score_label = $ColorRect/CenterContainer/GridContainer/HScoreContainer/HighestScoreValue
onready var time_label = $ColorRect/CenterContainer/GridContainer/TimeContainer/TimeValue
onready var home_btn = $Home
onready var play_again_btn = $PlayAgain
var root_node setget set_root_node


func disable_buttons():
	home_btn.disconnect("released", self, "_on_Home_released")
	play_again_btn.disconnect("released", self, "_on_PlayAgain_released")

	
func enable_buttons():
	home_btn.disconnect("released", self, "_on_Home_released")
	play_again_btn.disconnect("released", self, "_on_PlayAgain_released")


func set_root_node(value):
	root_node = value

func show_result(player):
	var message = Common.get_random_message()
	miles_label.text = str(player.miles) + "m"
	message_label.text = message
	longest_run_label.text = str(player.longest_distance) + "m"
	score_label.text = str(player.score)
	highest_score_label.text = str(player.highest_score)
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


func _on_Home_released():
	disable_buttons()
	yield(get_tree().create_timer(0.2), "timeout")
	Common.paused_game(false)
	root_node.pause_mode = PAUSE_MODE_STOP
	SceneTransition.change_scene("res://Game/UI/Screen/HomeScreen/HomeScreen.tscn")
	self.queue_free()

func _on_PlayAgain_released():
	disable_buttons()
	yield(get_tree().create_timer(0.2), "timeout")	
	var count_down_screen = Screen.countdown_screen.instance()
	root_node.emit_signal("add_popup_screen", count_down_screen)
	count_down_screen.set_root_node(root_node)
	count_down_screen.set_is_reload(true)
	count_down_screen.show_popup()
	count_down_screen.start_count_down()
	self.queue_free()
