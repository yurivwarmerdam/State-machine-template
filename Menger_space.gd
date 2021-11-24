extends Sprite

func _ready():
	#$Area2D.connect("input_event",self,"on_click")
	pass

#func on_click(_viewport:Node,event:InputEvent,_shape_idx:int):
#	if event is InputEventMouseButton && event.is_pressed():
#		print("space: "+event.to_string())
#		get_tree().is_input_handled()

var disable=true
func _unhandled_input(event):
	if !disable:
		if event is InputEventMouseButton && event.is_pressed():
			print("space: "+event.to_string())
