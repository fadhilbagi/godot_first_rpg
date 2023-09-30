extends Node2D

var speedTimer 
# Called when the node enters the scene tree for the first time.
func _ready():
	speedTimer= get_parent().get_node("SpeedTimer")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func DealDamage(target,value):
	target.takeDamage(value)

func EndTurn(object):
	object.get_node("ActionBar").value = 0
	await get_tree().create_timer(0.5).timeout
	speedTimer.start()
