extends Node2D

var speedTimer
var battleground 
# Called when the node enters the scene tree for the first time.
func _ready():
	battleground = get_parent()
	speedTimer= get_parent().get_node("SpeedTimer")
	get_node("/root/Battleground/HUD/Skills/Skill1").button_down.connect(_on_skill_1_button_down)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_skill_1_button_down():
	var executer = battleground.highestObject
	var skill = battleground.skills_scene.instantiate()
	
	get_node("/root/Battleground/HUD/Skills").hide()
	StartAttack(executer)
	await get_tree().create_timer(0.6).timeout
	
	StartSkill(skill)
	EndAttack(executer)
	DealDamage(battleground.mob,executer.attack)
	EndSkill(skill)
	EndTurn(executer)

func DealDamage(target,value):
	target.takeDamage(value)

func EndTurn(object):
	await get_tree().create_timer(0.5).timeout
	object.get_node("ActionBar").value = 0
	speedTimer.start()

func StartSkill(skill):
	skill.position = battleground.mob_spawn_location[0]
	get_parent().add_child(skill)
	skill.play("default")
func EndSkill(skill):
	await get_tree().create_timer(0.6).timeout
	skill.queue_free()
func StartAttack(object):
	object.play("attack")
func EndAttack(object):
	object.play("default")
