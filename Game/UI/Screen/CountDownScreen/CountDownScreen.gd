extends Popup


onready var timer = $Timer
onready var content = $VBoxContainer/Content
onready var background = $Background
onready var progress_bar = $VBoxContainer/ProgressBar
var root_node setget set_root_node
var is_reload setget set_is_reload
var index = 3

var arr = ["start", "1", "2", "3"]

# Called when the node enters the scene tree for the first time.
func start_count_down():
	root_node.show_label(true)
	root_node.show_paused_screen(false)
	root_node.show_paused_btn(false)
	timer.connect("timeout", self, "_on_Timer_timeout")
	print("im start on count down")
	timer.start()

func show_popup():
	self.show()

func _on_Timer_timeout():
	if(index > 0):
		progress_bar.value = 3 - index + 1
		index = index - 1
		content.text = arr[index]
		timer.start()	
	else:
		print("im out on count down")
		index = 3
		content.text = "3"
		Common.paused_game(false)
		root_node.show_main_content(true)	
		root_node.show_background(false)	
		root_node.enable_buttons()		
		if(is_reload):
			print(get_tree().current_scene, get_tree().get_root().get_children())
			print('reload current scene: ', get_tree().reload_current_scene())
		timer.disconnect("timeout", self, "_on_Timer_timeout")
		self.queue_free()
		
func set_root_node(value):
	root_node = value
	
func set_is_reload(value):
	is_reload = value


		
