extends Node2D

var battleService
var battleground
var targetLowestHp
# Called when the node enters the scene tree for the first time.
func _ready():
	battleService = get_node("/root/Battleground/BattleService")
	battleground = get_node("/root/Battleground")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func attack(executer,targets):
	var lowestHp = null
	var skill = battleground.skills_scene[0].instantiate()
	
	for target in targets:
		if lowestHp == null || lowestHp > target.hp :
			lowestHp = target.hp
			targetLowestHp = target
	
	battleService.defaultAttack(executer,skill,targetLowestHp.position,targetLowestHp,0.6)
