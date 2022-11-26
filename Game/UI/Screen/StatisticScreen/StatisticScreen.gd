extends Control

onready var popup_screen = $PopupScreen
onready var main_content = $MainContent
onready var parallax = $ParallaxRectangle
onready var score_btn = $MainContent/VBoxContainer/Score
onready var ememy_btn = $MainContent/VBoxContainer/Enemies
onready var exit_btn = $MainContent/VBoxContainer/Exit
onready var back_btn = $MainContent/Back

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

func show_main_content():
	main_content.show()

func add_popup(node):
	popup_screen.add_child(node)

func _on_Score_released():
	print("click score")
	disable_buttons()
	User.format_data()
	var screen = Screen.stats_screen.instance()
	screen.set_root_node(self)
	
	yield(get_tree().create_timer(0.2), "timeout")
	main_content.hide()
	add_popup(screen)
	screen.show()

func _on_Back_released():
	SceneTransition.change_scene("res://Game/UI/Screen/HomeScreen/HomeScreen.tscn")

func _on_Enemies_released():
	print("click score")
	disable_buttons()
	var screen = Screen.enemy_screen.instance()
	screen.set_root_node(self)
	
	yield(get_tree().create_timer(0.2), "timeout")
	main_content.hide()
	add_popup(screen)
	screen.show()


func _on_Exit_released():
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().quit()
