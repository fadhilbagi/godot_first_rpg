extends ProgressBar
signal action
var battleground 
var parent
# Called when the node enters the scene tree for the first time.
func _ready():
	self.value = 0
	battleground = get_parent().get_parent()
	parent = get_parent()
	
	battleground.get_node("SpeedTimer").connect("timeout",start)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start():
	var value = self.value
	if(value < self.max_value) : 
		self.value += parent.velocity
	else :
		action.emit()
