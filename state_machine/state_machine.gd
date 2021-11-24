extends Node
#this script universal for all state machines
class_name state_machine

var state:State
var history:Array=[]

func _ready():
	state=get_child(0)
	_enter_state()

func _enter_state():
	state.state_machine=self
	state.enter()

func _exit_state():
	state.exit()

func _exit_state_type():
	state.exit_state_type()

#----------------------
#public function block:
#----------------------
func change_to(state_name:String):
	history.append(state)
	if !is_same_type(state,get_node(state_name)):
	#if state.state_type != get_node(state_name).state_type:
		_exit_state_type()
	_exit_state()
	state=get_node(state_name)
	_enter_state()

func back():
	if history.size() >0:
		if !is_same_type(history[history.size()-1],state):
		#if history[history.size()-1].state_type != state.state_type:
			_exit_state_type()
		_exit_state()
		state = history.pop_back()
		_enter_state()

func is_same_type(first:State, second:State)->bool:
	else:
		return first.get_class() == second.get_class()

#processing/input delegation block:
func _process(delta):
	if state.has_method("process"): state.process(delta)
func _physics_process(delta):
	if state.has_method("physics_process"): state.physics_process(delta)
func _input(event):
	if state.has_method("input"): state.input(event)
func _unhandled_input(event):
	if state.has_method("unhandled_input"): state.unhandled_input(event)
#TODO: evaluate if I want to keep this here, or pipe it through unhandled_input, and set something to handled() or whatever.
func handle_click(event:InputEvent,entity:Node2D)->bool:
	if state.has_method("handle_click"): return state.handle_click(event,entity)
	else: return false
