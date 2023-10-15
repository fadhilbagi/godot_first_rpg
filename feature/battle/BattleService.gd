extends Node2D

var speedTimer
var battleground 
# Called when the node enters the scene tree for the first time.
func _ready():
	battleground = get_parent()
	speedTimer= get_parent().get_node("SpeedTimer")
	get_node("/root/Battleground/HUD/Skills/Skill1").button_down.connect(_on_skill_1_button_down)
	get_node("/root/Battleground/HUD/Skills/Skill3").button_down.connect(_on_skill_3_button_down)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_skill_1_button_down():
	var executer = battleground.highestObject
	var target =  battleground.mob
	var skill = battleground.skills_scene[0].instantiate()
	
	get_node("/root/Battleground/HUD/Skills").hide()
	defaultAttack(executer,skill,target.position,target,0.1)

func DealDamage(target,value):
	target.takeDamage(value)
	spawn_effect_damage(battleground.damage_scene,target,value)
	
func spawn_effect_damage(EFFECT,target,value):
	var effect = EFFECT.instantiate()
	effect.position = target.position
	battleground.add_child(effect)
	effect.label.text = str(value)

func EndTurn(object):
	#await get_tree().create_timer(0.5).timeout
	object.get_node("ActionBar").value = 0
	speedTimer.start()

func StartSkill(skill,target):
	skill.position = target
	get_parent().add_child(skill)
	skill.play("default")
func EndSkill(skill):
	skill.queue_free()

func StartAttack(object):
	object.play("attack")
func EndAttack(object):
	object.play("default")

func defaultAttack(executer,skill,targetLocation,targetObject,delay):
	StartAttack(executer)
	await get_tree().create_timer(0.6).timeout
	StartSkill(skill,targetLocation)
	EndAttack(executer)
	await get_tree().create_timer(delay).timeout
	DealDamage(targetObject,executer.attack)
	EndSkill(skill)
	await get_tree().create_timer(0.8).timeout
	EndTurn(executer)


func _on_skill_3_button_down():
	var executer = battleground.highestObject
	var target =  battleground.mob
	var skill = battleground.skills_scene[1].instantiate()
	var targetAoe = get_node("/root/Battleground/EnemyAoe")
	
	get_node("/root/Battleground/HUD/Skills").hide()
	defaultAttack(executer,skill,targetAoe.position,target,1.2)
	pass # Replace with function body.


