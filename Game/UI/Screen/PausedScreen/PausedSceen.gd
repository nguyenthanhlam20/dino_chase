extends Popup

onready var root_node = self.owner
onready var home_btn = $CenterContainer/Home
onready var settings_btn = $CenterContainer/Settings 
onready var restart_btn = $CenterContainer/Restart
onready var play_btn = $CenterContainer/Play

onready var screens = ScreenSettings.screens

func _ready():
	enable_buttons()

func disable_buttons():
	if(home_btn.is_connected("released", self, "_on_Home_released")):
		home_btn.disconnect("released", self, "_on_Home_released")
		
	if(settings_btn.is_connected("released", self, "_on_Settings_released")):
		settings_btn.disconnect("released", self, "_on_Settings_released")
		
	if(restart_btn.is_connected("released", self, "_on_Restart_released")):
		restart_btn.disconnect("released", self, "_on_Restart_released")
		
	if(play_btn.is_connected("released", self, "_on_Play_released")):
		play_btn.disconnect("released", self, "_on_Play_released")
	
func enable_buttons():
	if(!home_btn.is_connected("released", self, "_on_Home_released")):
		home_btn.connect("released", self, "_on_Home_released")
		
	if(!settings_btn.is_connected("released", self, "_on_Settings_released")):
		settings_btn.connect("released", self, "_on_Settings_released")
		
	if(!restart_btn.is_connected("released", self, "_on_Restart_released")):
		restart_btn.connect("released", self, "_on_Restart_released")
		
	if(!play_btn.is_connected("released", self, "_on_Play_released")):
		play_btn.connect("released", self, "_on_Play_released")
	
func _on_Home_released():
	disable_buttons()
	yield(get_tree().create_timer(0.2), "timeout")
	Common.paused_game(false) 
	root_node.stop_all_objects()
	SceneTransition.change_scene(root_node, screens.get("HOME_SCREEN"))

func _on_Settings_released():
	disable_buttons()
	yield(get_tree().create_timer(0.2), "timeout")
	var screen = load(screens.get("SETTINGS_SCREEN")).instance()
	root_node.add_popup_screen(screen)
	screen.set_home_screen(root_node)
	screen.showPopup()

func _on_Restart_released():
	count_down_settings(true)
	
func _on_Play_released():
	count_down_settings(false)

func count_down_settings(value):
	disable_buttons()
	yield(get_tree().create_timer(0.2), "timeout")

	var count_down_screen = load(screens.get("COUNTDOWN_SCREEN")).instance()
	root_node.add_popup_screen(count_down_screen)
	count_down_screen.set_root_node(root_node)
	count_down_screen.set_is_reload(value)
	count_down_screen.show_popup()
	count_down_screen.start_count_down()


