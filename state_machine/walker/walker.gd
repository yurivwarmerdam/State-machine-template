extends KinematicBody2D
class_name walker

#global variables that all states should be able to access
var speed=4000

#This hooks into the Whiteboard pattern I love to use. 
#Check out the whiteboard script,
#and project > project settings > Autoload
#I think the book probably touches on this in the Singleton chapter, 
#but I have not gotten that far, yet.
func _ready():
	Whiteboard.add_walker(self)
