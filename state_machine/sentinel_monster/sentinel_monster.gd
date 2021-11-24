extends Node2D

class_name sentinel_monster

var sight_range:int=100

func _ready():
	Whiteboard.add_sentinel(self)

func _draw():
	draw_circle(Vector2.ZERO,sight_range,Color.blue)
