extends Node2D
var health = 25
var speed = 128
var attack = 4
var velocity = speed

signal action

# Called when the node enters the scene tree for the first time.
func _ready():
	$ActionBar.value = 0
	get_parent().get_node("SpeedTimer").connect("timeout",startGame)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start(pos):
	position = pos
	show()

func startGame():
	var value = $ActionBar.value
	if(value < $ActionBar.max_value) : 
		$ActionBar.value += velocity
	else :
		action.emit()
