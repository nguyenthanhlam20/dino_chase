extends Control

onready var back_btn = $TopRightPos/Back
onready var effectVolume = $GridContainer/EffectVolume
onready var musicVolume = $GridContainer/MusicVolume
onready var swap_input = $GridContainer/SwapInput
onready var timer_status = $GridContainer/TimerStatus
onready var root_node setget set_root_node

func set_root_node(value):
	root_node = value
	
func disable_btn():
	back_btn.disconnect("released", self, "_on_Back_released")	

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

func _on_EffectVolume_value_changed(value):
	GameSettings.playEffect(Constants.COIN_EFFECT)
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
	
	if(root_node.name == "World"):
		root_node.set_input_position() 



func _on_MusicVolume_changed():
	pass # Replace with function body.



func _on_TimerStatus_pressed():
	if(GameSettings.timer_status):
		GameSettings.timer_status = false
		timer_status.text = "off"
	else:
		GameSettings.timer_status = true
		timer_status.text = "on"
	
	if(root_node.name == "World"):
		root_node.show_timer() 

func _on_Back_released():
	disable_btn()
	yield(get_tree().create_timer(0.1), "timeout")
	GameSettings.save_settings_data()
	root_node.enable_buttons()
	if(root_node.name == "HomeScreen"):
		get_tree().paused = false
	self.queue_free()
