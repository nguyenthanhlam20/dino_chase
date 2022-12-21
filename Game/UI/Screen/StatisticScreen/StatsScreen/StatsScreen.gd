extends Popup

onready var scroll_container = $ScrollContainer
onready var general_box = $ScrollContainer/VBoxContainer/GeneralBox
onready var best_distance = $ScrollContainer/VBoxContainer/BestDistance
onready var character_pick = $ScrollContainer/VBoxContainer/CharacterPick
onready var map_pick = $ScrollContainer/VBoxContainer/MapPick
onready var root_node = self.get_parent()

#var current_mouse_position : float
#var previous_mouse_position : float

func _ready() -> void:
#	print(User.data)
	User.format_data()
	general_box.set_value("General", User.data.general)
	best_distance.set_value("Best Distance", User.data.best_distance)
	character_pick.set_value("Character Pick", User.data.character_pick)
	map_pick.set_value("Map Pick", User.data.map_pick)
	scroll_container.get_v_scrollbar().modulate.a = 0
	
func _on_Return_pressed():
	yield(get_tree().create_timer(0.2), "timeout")
	self.hide()
	root_node.show_button_group(true)
	root_node.enable_buttons()

