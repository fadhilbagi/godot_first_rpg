extends Node2D

var battleService
var targetLowestHp
# Called when the node enters the scene tree for the first time.
func _ready():
	battleService = get_node("/root/Battleground/BattleService")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func attack(executer,targets):
	var lowestHp = null
	
	for target in targets:
		if lowestHp == null || lowestHp > target.hp :
			lowestHp = target.hp
			targetLowestHp = target
	
	battleService.DealDamage(targetLowestHp,executer.attack)
	battleService.EndTurn(executer)	
