extends Node2D

func _ready():
	$Area2D.connect("input_event",self,"on_click")

func on_click(viewport:Node,event:InputEvent, shape_idx:int):
	if event is InputEventMouseButton && event.is_pressed() && event.button_index == BUTTON_LEFT:
		print("asd")
		delete_child()
		pass

func delete_child():
	$deletable.queue_free()
	pass
