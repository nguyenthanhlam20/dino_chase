extends Control


onready var button_group = $ButtonGroup
onready var enemy_screen = load(Constants.ENEMY_SCREEN)
onready var stats_screen = load(Constants.STATS_SCREEN)
onready var back_btn = $ButtonGroup/Back
onready var exit_btn = $ButtonGroup/TopRightPos/Exit
onready var score_btn = $ButtonGroup/VBoxContainer/Score
onready var ememy_btn = $ButtonGroup/VBoxContainer/Enemies
onready var credit_btn = $ButtonGroup/VBoxContainer/Credits
onready var cover_background = load(Constants.COVER_BACKGROUND)
onready var leave_screen = load(Constants.LEAVE_SCREEN)

var reusable_ins : Control

func disable_buttons():
	if(score_btn.is_connected("released", self, "_on_Score_released")):
		score_btn.disconnect("released", self, "_on_Score_released")
		
	if(ememy_btn.is_connected("released", self, "_on_Enemies_released")):
		ememy_btn.disconnect("released", self, "_on_Enemies_released")
		
	if(back_btn.is_connected("released", self, "_on_Back_released")):
		back_btn.disconnect("released", self, "_on_Back_released")
		
	if(credit_btn.is_connected("released", self, "_on_Credits_released")):
		credit_btn.disconnect("released", self, "_on_Credits_released")

func enable_buttons():
	if(!score_btn.is_connected("released", self, "_on_Score_released")):
		score_btn.connect("released", self, "_on_Score_released")
		
	if(!ememy_btn.is_connected("released", self, "_on_Enemies_released")):
		ememy_btn.connect("released", self, "_on_Enemies_released")
		
	if(!back_btn.is_connected("released", self, "_on_Back_released")):
		back_btn.connect("released", self, "_on_Back_released")
	
	if(!credit_btn.is_connected("released", self, "_on_Credits_released")):
		credit_btn.connect("released", self, "_on_Credits_released")
	
func show_button_group(value: bool):
	button_group.set("visible", value)
	if(value):
		enable_buttons()
	else:
		disable_buttons()
	
func _on_Score_released():
	disable_buttons()
	User.format_data()
	yield(get_tree().create_timer(0.1), "timeout")
	show_button_group(false)
	reusable_ins = stats_screen.instance()
	self.add_child(reusable_ins)

func _on_Back_released():
	disable_buttons()
	SceneTransition.change_scene(self, Constants.HOME_SCREEN)

func _on_Enemies_released():
	disable_buttons()
	yield(get_tree().create_timer(0.1), "timeout")
	show_button_group(false)
	reusable_ins = enemy_screen.instance()
	self.add_child(reusable_ins)


func _on_Exit_released():
	disable_buttons()
	yield(get_tree().create_timer(0.1), "timeout")
	if(!self.has_node("LeaveScreen")):
#		var cover_background_instance = cover_background.instance()
#		self.add_child(cover_background_instance)
		show_button_group(false)
		var leave_screen_ins = leave_screen.instance()
		leave_screen_ins.set_root_node(self)
		self.add_child(leave_screen_ins)
		leave_screen_ins.show_popup()

func clear_cover_background():
	self.remove_child(self.get_node("CoverBackground"))

func _on_Credits_released():
	disable_buttons()
	yield(get_tree().create_timer(0.1), "timeout")
