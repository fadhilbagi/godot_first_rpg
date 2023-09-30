extends Node2D
var type = "player"
var maxHP = 25
var hp = maxHP
var speed = 128
var attack = 4
var velocity = speed


# Called when the node enters the scene tree for the first time.
func _ready():
	#get_parent().get_node("SpeedTimer").connect("timeout",startGame)
	add_to_group("players")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start(pos):
	position = pos
	show()

func takeDamage(damage):
	hp -= damage 

