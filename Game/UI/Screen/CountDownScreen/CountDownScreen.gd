extends Control


onready var timer = $Timer
onready var progress_timer = $ProgessTimer
onready var content = $VBoxContainer/Content
onready var progress_bar = $VBoxContainer/ProgressBar
var root_node setget set_root_node
var is_reload setget set_is_reload
var index = 3

var arr = ["start", "1", "2", "3"]

# Called when the node enters the scene tree for the first time.
func start_count_down():
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.start()
	progress_timer.start()

func _on_Timer_timeout():
	if(index > 0):
		index = index - 1
		content.text = arr[index]
		timer.start()	
	else:
		index = 3
		content.text = "3"
		Common.paused_game(false)
		root_node.show_paused_btn(true)
		root_node.remove_node_by_name("CoverBackground")
		if(is_reload):
			print('reload current scene: ', get_tree().reload_current_scene())
		timer.disconnect("timeout", self, "_on_Timer_timeout")
		self.queue_free()
		
func set_root_node(value):
	root_node = value
	
func set_is_reload(value):
	is_reload = value
	
func _on_ProgessTimer_timeout():
	progress_bar.value = progress_bar.value + progress_bar.step
	progress_timer.start()
