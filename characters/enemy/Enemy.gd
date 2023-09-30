extends AnimatedSprite2D
var type = "enemy"
var maxHP = 20
var hp = maxHP
var speed = 200
var attack = 3
var velocity = speed

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("mobs")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func takeDamage(damage):
	hp -= damage 

func execAttack(executer,target):
	$EnemyAlgo.attack(executer,target)
