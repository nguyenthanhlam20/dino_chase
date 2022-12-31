extends Control

export(int) var gravity = 15
export(int) var fat_bird_gravity = 12
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

export(String) var original_trackUrl = Constants.BACKGROUND_MUSIC

onready var music_player = $Music
onready var effect_player = $Effect
onready var right_pos = $RightPos

var right_position : Vector2
var is_effect_playing = false
var FILE_SETTINGS_PATH = "user://ssetticngssd_data.tres"


func _ready():
	get_settings_data()
	right_position = right_pos.rect_position
	print("right_position", right_position)

#	Play music
#	music_player.autoplay = true
#	playMusic(original_trackUrl)


func get_settings_data():
	var file = File.new()
	if(file.file_exists(FILE_SETTINGS_PATH)):
		file.open(FILE_SETTINGS_PATH, File.READ)
		var data = parse_json(file.get_as_text())
		music_volume = float(data.music_volume)
		effect_volume = float(data.effect_volume)
		swap_input = bool(data.swap_input)
		timer_status = bool(data.timer_status)
		PlayerSettings.current_player = int(data.current_player)
		MapSettings.current_map = int(data.current_map)
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
		"current_player": PlayerSettings.current_player,
		"current_map": MapSettings.current_map
	}
#	print(settings_data)
	file.store_string(to_json(settings_data))
	file.close()


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
	effect_player.autoplay = false
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
