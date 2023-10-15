extends Node2D

@export var SPEED: int = 30
@export var FRICTION: int = 15
var SHIFT_DIRECTION: Vector2 = Vector2.ZERO

var label 
# Called when the node enters the scene tree for the first time.
func _ready():
	label = $Label
	SHIFT_DIRECTION = Vector2(randi_range(-1,1), randi_range(-1,1))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += SPEED * SHIFT_DIRECTION * delta
	SPEED = max(SPEED -FRICTION * delta,0)
