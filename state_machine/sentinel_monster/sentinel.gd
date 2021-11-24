extends State

onready var state_owner:sentinel_monster=owner

func enter():
	pass

func is_in_sight_range(other:Node2D)->bool:
	var distance=(state_owner.position-other.position).length()
	if distance<owner.sight_range:
		return true
	else: return false

func process(delta):
	for walker in Whiteboard.walkers:
		if is_in_sight_range(walker):
			change_to_attack()
			break
			

func change_to_attack():
	state_machine.change_to("attack")
