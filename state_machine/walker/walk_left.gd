extends State

onready var state_owner:walker=owner

var target:Vector2

func enter():
	target=Vector2(0,state_owner.position.y)

func physics_process(delta):
	state_owner.move_and_slide(Vector2.LEFT*state_owner.speed*delta)
	if state_owner.position<=target: exit()

func exit():
	state_machine.change_to("walk_right")
