extends Control

onready var main_content = $MainContent
onready var option_btn = $MainContent/HBoxContainerBottom/Options
onready var play_btn = $MainContent/HBoxContainerBottom/Play
onready var more_btn = $MainContent/HBoxContainerBottom/More
onready var screens = ScreenSettings.get_screens()


# Called when the node enters the scene tree for the first time.
func _ready():
	enable_buttons()
	
func show_main_content(value):
	main_content.visible = value

func disable_buttons():
	option_btn.disconnect("released", self, "_on_Options_released")
	play_btn.disconnect("released", self, "_on_Play_released")
	more_btn.disconnect("released", self, "_on_More_released")
	
func enable_buttons():
	option_btn.connect("released", self, "_on_Options_released")
	play_btn.connect("released", self, "_on_Play_released")
	more_btn.connect("released", self, "_on_More_released")
	
func _on_Options_released():
	disable_buttons()
	yield(get_tree().create_timer(0.2), "timeout")
	var settings_screen = load(screens.get("SETTINGS_SCREEN")).instance()
	settings_screen.set_home_screen(self)
	self.add_child(settings_screen)
	settings_screen.showPopup()

func _on_Play_released():
	disable_buttons()
	yield(get_tree().create_timer(0.2), "timeout")
	SceneTransition.change_scene(self, screens.get("CHARACTER_SCREEN"))

func _on_More_released():
	disable_buttons()
	yield(get_tree().create_timer(0.2), "timeout")
	SceneTransition.change_scene(self, screens.get("STATISTIC_SCREEN"))
