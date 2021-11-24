extends State

onready var state_owner:walker=owner

var target:Vector2

func enter():
	target=Vector2(1024,state_owner.position.y)

func physics_process(delta):
# warning-ignore:return_value_discarded
	state_owner.move_and_slide(Vector2.RIGHT*state_owner.speed*delta)
	if state_owner.position>=target: exit()

func exit():
	state_machine.change_to("walk_left")
