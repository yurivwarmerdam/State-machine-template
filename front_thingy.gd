extends Node2D

func _ready():
	$Area2D.connect("input_event",self,"on_click")

func on_click(_viewport:Node,event:InputEvent,_shape_idx:int):
	if event is InputEventMouseButton && event.is_pressed():
		print("front: "+event.to_string())
		get_tree().is_input_handled()
