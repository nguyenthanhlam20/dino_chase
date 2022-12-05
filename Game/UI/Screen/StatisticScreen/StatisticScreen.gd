extends Control

onready var popup_screen = $PopupScreen
onready var button_group = $ButtonGroup
onready var enemy_screen = $EnemyScreen
onready var stats_screen = $StatsScreen
onready var back_btn = $ButtonGroup/Back
onready var parallax = $ParallaxRectangle
onready var exit_btn = $ButtonGroup/VBoxContainer/Exit
onready var score_btn = $ButtonGroup/VBoxContainer/Score
onready var ememy_btn = $ButtonGroup/VBoxContainer/Enemies
onready var screens = ScreenSettings.get_screens()

func disable_buttons():
	score_btn.disconnect("released", self, "_on_Score_released")
	ememy_btn.disconnect("released", self, "_on_Enemies_released")
	back_btn.disconnect("released", self, "_on_Back_released")

func enable_buttons():
	print("enable buttons")
	score_btn.connect("released", self, "_on_Score_released")
	ememy_btn.connect("released", self, "_on_Enemies_released")
	back_btn.connect("released", self, "_on_Back_released")
	

func _ready():
	parallax.start = true

func show_button_group(value: bool):
	button_group.set("visible", value)
	
func _on_Score_released():
	disable_buttons()
	User.format_data()
	yield(get_tree().create_timer(0.2), "timeout")
	show_button_group(false)
	stats_screen.show()

func _on_Back_released():
	SceneTransition.change_scene(self, screens.get("HOME_SCREEN"))

func _on_Enemies_released():
	disable_buttons()
	yield(get_tree().create_timer(0.2), "timeout")
	show_button_group(false)
	enemy_screen.show()


func _on_Exit_released():
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().quit()
