extends State
class_name walker_state

#I like to put something like the following in my "parent" State for each type 
#of FSM I put in my game.
#This helps the IDE know what functions/vairables I put in the parent, 
#and gives me better autocomplete.
onready var state_owner:walker=owner
