extends Label

onready var title_value = $CenterContainer/GridContainer/Title/Value
onready var spring = $CenterContainer/GridContainer/Spring
onready var summer = $CenterContainer/GridContainer/Summer
onready var autumn = $CenterContainer/GridContainer/Autumn
onready var winter = $CenterContainer/GridContainer/Winter
onready var map_unlock = User.data.completion.map
onready var maps = MapSettings.maps
onready var container = $CenterContainer/GridContainer
var height : int
func _ready():
	pass # Replace with function body.

func set_value(title, data):
#	print(data.distance)
	title_value.text = title
	
	spring.set_value(data.spring)
	summer.set_value(data.summer)
	autumn.set_value(data.autumn)
	winter.set_value(data.winter)
	
	var index : int
	var count = 0
	var map_container : HBoxContainer
	for map in maps:
		index = map.get("index")
		map_container = container.get_node(map.get("map_name"))
		if(index in map_unlock):
			count += 1
			map_container.visible = true
		else:
			map_container.visible = false
	if(count % 2 == 1):
		height = ((count + 3) * 14) - 4
	else:
		height = (count + 3) * 14
		
#	print(height)
	self.rect_min_size.y = height
	
