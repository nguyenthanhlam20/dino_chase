extends Popup

onready var scroll_container = $ScrollContainer
var root_node setget set_root_node

onready var general_box = $ScrollContainer/CenterContainer/Container/VBoxContainer/GeneralBox
onready var best_box = $ScrollContainer/CenterContainer/Container/VBoxContainer/BestBox

#func _process(delta):
#	print("process", scroll_container.scroll_vertical)

var current_mouse_position : float
var previous_mouse_position : float

func _ready() -> void:
#	print(User.data)
	general_box.set_value("General", User.data.general)
	best_box.set_value("Best", User.data.best)
	scroll_container.get_v_scrollbar().modulate.a = 0

func _input(event):
   # Mouse in viewport coordinates.
	if event is InputEventScreenDrag:
		previous_mouse_position = current_mouse_position
		current_mouse_position = event.position.y
		var difference = previous_mouse_position - current_mouse_position
#		print(previous_mouse_position," " , current_mouse_position)#	
		print(difference)
		if(difference != 0):
			if(difference > 0):
				if(scroll_container.scroll_vertical < 55): 
					scroll_container.scroll_vertical = scroll_container.scroll_vertical + difference
			else:
				if(scroll_container.scroll_vertical >0): 
					scroll_container.scroll_vertical = scroll_container.scroll_vertical + difference
		
		print("scroll vertical", scroll_container.scroll_vertical)



func _on_Return_pressed():
	yield(get_tree().create_timer(0.2), "timeout")
	self.queue_free()
	root_node.show_main_content()
	root_node.enable_buttons()

func set_root_node(value):
	root_node = value



func _on_ScrollContainer_scroll_started():
	print("scrolling")
