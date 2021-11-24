extends State

onready var sprite:Sprite=owner.get_node("Sprite")
onready var state_owner:sentinel_monster=owner
var previous_rect:Rect2

var target:Node2D=null

func enter():
	for walker in Whiteboard.walkers:
		if is_in_sight_range(walker):
			target=walker
			break
	if target:
		previous_rect=sprite.get_region_rect()
		var new_rect=previous_rect
		new_rect.position=Vector2(84,22)
		sprite.set_region_rect(new_rect)

func process(_delta):
	if !is_in_sight_range(target):
		state_machine.change_to("sentinel")

func exit():
	sprite.set_region_rect(previous_rect)

func is_in_sight_range(other:Node2D)->bool:
	var distance=(state_owner.position-other.position).length()
	if distance<owner.sight_range:
		return true
	else: return false
