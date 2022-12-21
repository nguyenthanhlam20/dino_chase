extends Node2D

export(int) var gravity = 15
export(int) var flat_bird_gravity = 5
export(int) var terminal_gravity = 400
export(int) var music_volume = 0 setget set_music_volume
export(int) var effect_volume = 0 setget set_effect_volume
export(bool) var swap_input = false
export(bool) var timer_status = false
export(int) var music_volume_max = 12
export(int) var music_volume_min = -40
export(int) var effect_volume_max = 12
export(int) var effect_volume_min = -40

export(int) var player_position_x = 30
export(int) var run_base_speed = 1
export(int) var fly_base_speed = 1

export(String) var original_trackUrl = "res://Resource/Music/music.mp3"

onready var viewport = get_viewport()
onready var music_player = $Music
onready var effect_player = $Effect
onready var game_size = Vector2(
	ProjectSettings.get_setting("display/window/size/width"),
	ProjectSettings.get_setting("display/window/size/height"))

var random = RandomNumberGenerator.new()

var is_effect_playing = false
var FILE_SETTINGS_PATH = "user://ssetticngss_data.tres"


func get_settings_data():
	var file = File.new()
	if(file.file_exists(FILE_SETTINGS_PATH)):
		file.open(FILE_SETTINGS_PATH, File.READ)
		var data = parse_json(file.get_as_text())
		music_volume = float(data.music_volume)
		effect_volume = float(data.effect_volume)
		swap_input = bool(data.swap_input)
		timer_status = bool(data.timer_status)
		PlayerSettings.current_player_index = int(data.current_player_index)
		MapSettings.current_map_index = int(data.current_map_index)
		set_music_volume(music_volume)
		set_effect_volume(effect_volume)
		file.close()
	else:
		save_settings_data()
#		print("File doesn't exist")

func save_settings_data():
	var file = File.new()
	file.open(FILE_SETTINGS_PATH, File.WRITE)
	var settings_data = {
		"music_volume" : music_volume,
		"effect_volume" : effect_volume,
		"swap_input" : swap_input,
		"timer_status": timer_status,
		"current_player_index": PlayerSettings.current_player_index,
		"current_map_index": MapSettings.current_map_index
	}
#	print(settings_data)
	file.store_string(to_json(settings_data))
	file.close()

func _ready():
#	Get settings data
	get_settings_data()
#	Resize viewport
#	viewport.connect("size_changed", self, "resize_viewport")
#	resize_viewport()
#	Create random number
	random.randomize()
#	Play music
	music_player.autoplay = true
	playMusic(original_trackUrl)

func resize_viewport():
#	OS.get_real_window_size()
	var new_size = OS.get_window_size()
	var scale_factor
	print("original window size", new_size)

	if new_size.x > game_size.x:
		scale_factor = new_size.x/game_size.x
		new_size = Vector2(new_size.x/scale_factor, new_size.y)
	else:
		scale_factor = game_size.x/new_size.x
		new_size = Vector2(new_size.x*scale_factor, new_size.y)
		
	if new_size.y > game_size.y:
		scale_factor = new_size.y/game_size.y
		new_size = Vector2(new_size.x, new_size.y/scale_factor)
	else:
		scale_factor = game_size.y/new_size.y
		new_size = Vector2(new_size.x, new_size.y*scale_factor)
		
	print("old size", game_size, "new size", new_size)
		
	viewport.set_size_override(true, new_size)
	
func playMusic(trackUrl : String):
	music_player.stream = load(trackUrl)
	music_player.play()

func stopMusic():
	music_player.stop()

func set_music_volume(value : float):
	music_volume = value
	music_player.volume_db = value
	
func playEffect(trackUrl : String):
	is_effect_playing = true
	effect_player.stream = load(trackUrl)
	effect_player.play()
	
func stopEffect():
	effect_player.stop()

func set_effect_volume(value : float):
	effect_volume = value
	effect_player.volume_db = value
#	print("Effect Value: ", value)

func _on_Music_finished():
	pass

func _on_Effect_finished():
	is_effect_playing = false
