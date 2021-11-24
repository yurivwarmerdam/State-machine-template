extends Node
class_name State
func get_class(): return "State"

#this is always of type State_machine
#but we're not allowed to use circular references till godot 4
var state_machine:Node

#you should probably implement an enter func.
func enter():
	pass
#and maybe an exit, too?
func exit():
	pass

#useful for exiting a "domain".
#enum example_types {UNKNOWN}
#var state_type=example_types.UNKNOWN
func exit_state_type():
	pass
#------------------#
#duck typing stuff:
#func process(delta):
#func physics_process(delta):
#...
#------------------#
