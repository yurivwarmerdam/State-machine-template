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

#this makes the FSM into a cellular automata. Don't ask me what exactly that means. 
#It's useful, though.
func back():
	if history.size() >0:
		if !is_same_type(history[history.size()-1],state):
		#if history[history.size()-1].state_type != state.state_type:
			_exit_state_type()
		_exit_state()
		state = history.pop_back()
		_enter_state()

#This check gives you access to a "bonus" exit() function, to clean up
#anything that you DO want to keep when staying inside the state "domain"
func is_same_type(first:State, second:State)->bool:
	return first.get_class() == second.get_class()

#----------------------
#processing/input delegation block:
#----------------------
func _process(delta):
	if state.has_method("process"): state.process(delta)
func _physics_process(delta):
	if state.has_method("physics_process"): state.physics_process(delta)
	
#Note: these two I am still doubting if it should be here. Be careful with it.
func _input(event):
	if state.has_method("input"): state.input(event)
func _unhandled_input(event):
	if state.has_method("unhandled_input"): state.unhandled_input(event)
