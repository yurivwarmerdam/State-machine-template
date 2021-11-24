#attention: this is an inherited State!
extends walker_state

var target:Vector2

func enter():
	target=Vector2(1024,state_owner.position.y)

func physics_process(delta):
# warning-ignore:return_value_discarded
	state_owner.move_and_slide(Vector2.RIGHT*state_owner.speed*delta)
	if state_owner.position>=target: state_machine.change_to("walk_left")
