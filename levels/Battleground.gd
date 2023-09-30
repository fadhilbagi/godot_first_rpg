extends Node2D
@export var mob_scene: PackedScene
@export var player_scene: PackedScene

var player
var mob
var highestBar
var highestObject

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().call_group(&"mobs", &"queue_free")
	get_tree().call_group(&"players", &"queue_free")
	
	player = player_scene.instantiate()
	var player_spawn_location = $Player1Start.position
	player.position = player_spawn_location
	add_child(player)
	player.get_node("ActionBar").action.connect(_on_action)
	
	mob = mob_scene.instantiate()
	var mob_spawn_location = $Enemy1Start.position
	mob.position = mob_spawn_location
	add_child(mob)
	mob.get_node("ActionBar").action.connect(_on_action)
	
	
	$HUD/Skills.hide()
	$SpeedTimer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_action():
	$SpeedTimer.stop()
	var players = get_tree().get_nodes_in_group(&"players")
	var mobs = get_tree().get_nodes_in_group(&"mobs")
	highestBar = 0
	highestObject = null
	
	setHighestBar(players)
	setHighestBar(mobs)
	
	if(highestBar >= 1000):
		if (highestObject.type == "player"):
			$HUD/Skills.show()
		else :
			highestObject.execAttack(highestObject,players)
	
func setHighestBar(objects):
	for object in objects :
		var actionBarVal = object.get_node("ActionBar").value
		if(highestBar<actionBarVal):
			highestObject = object
			highestBar = actionBarVal


func _on_skill_1_button_down():
	$HUD/Skills.hide()
	$BattleService.DealDamage(mob,highestObject.attack)
	$BattleService.EndTurn(highestObject)
	
	pass # Replace with function body.
