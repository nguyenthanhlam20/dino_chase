extends Popup

onready var back_btn = $Back
onready var effectVolume = $GridContainer/EffectVolume
onready var musicVolume = $GridContainer/MusicVolume
onready var swap_input = $GridContainer/SwapInput
onready var timer_status = $GridContainer/TimerStatus
onready var home_screen setget set_home_screen


var click = 0;
var is_first_load = true

var show_popup_status = true
var is_show_popup = false

func set_home_screen(value):
	home_screen = value
	
func disable_btn():
	back_btn.disconnect("released", self, "_on_Back_released")	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_SettingsMenu_run_background():
	show_popup_status = false
	home_screen.show_main_content(false)
	if(home_screen.name == "World"):
		home_screen.show_paused_screen(false)

# Called when the node enters the scene tree for the first time.
func _ready():
#	Set min and max for music and effect
	musicVolume.max_value = GameSettings.music_volume_max
	musicVolume.min_value = GameSettings.music_volume_min
	effectVolume.max_value = GameSettings.effect_volume_max
	effectVolume.min_value = GameSettings.effect_volume_min
	
#	Get settings volume
	musicVolume.value = GameSettings.music_volume
	effectVolume.value = GameSettings.effect_volume
	
	if(GameSettings.swap_input): 
		swap_input.text = "on"
	else:
		swap_input.text = "off"
		
	if(GameSettings.timer_status): 
		timer_status.text = "on"
	else:
		timer_status.text = "off"
		
	swap_input.set("pressed", GameSettings.swap_input)
	timer_status.set("pressed", GameSettings.timer_status)

func showPopup():
	if(self.visible):
		self.hide()
	else:
		self.show()


func _on_EffectVolume_value_changed(value):
	if(!is_first_load):
		GameSettings.playEffect(EffectSettings.COIN_EFFECT)
	else: 
		is_first_load = false
	GameSettings.set_effect_volume(value)



func _on_MusicVolume_value_changed(value):
	GameSettings.set_music_volume(value)


func _on_SwapInput_pressed():
	if(GameSettings.swap_input):
		GameSettings.swap_input = false
		swap_input.text = "off"
	else:
		GameSettings.swap_input = true
		swap_input.text = "on"
	
	if(home_screen.name == "World"):
		home_screen.set_input_position() 
#	print(GameSettings.swap_input)


func _on_MusicVolume_changed():
	pass # Replace with function body.



func _on_TimerStatus_pressed():
	if(GameSettings.timer_status):
		GameSettings.timer_status = false
		timer_status.text = "off"
	else:
		GameSettings.timer_status = true
		timer_status.text = "on"
	
	if(home_screen.name == "World"):
		home_screen.show_timer() 

func _on_Back_released():
	disable_btn()
	yield(get_tree().create_timer(0.2), "timeout")
	showPopup()
	home_screen.show_main_content(true)
	home_screen.enable_buttons()
	if(home_screen.name == "World"):
		home_screen.show_paused_screen(true)
		home_screen.show_background(true)
	GameSettings.save_settings_data()
