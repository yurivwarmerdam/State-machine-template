extends KinematicBody2D

class_name walker

var speed=4000

func _ready():
	Whiteboard.add_walker(self)
