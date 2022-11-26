extends CanvasLayer

onready var loading_icon = $LoadingContainer/LoadingIcon

var visible_status = false

func showLoading(value: bool): 
	self.visible = value
