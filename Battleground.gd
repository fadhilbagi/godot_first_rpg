extends Node2D
@export var mob_scene: PackedScene
@export var player_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().call_group(&"mobs", &"queue_free")
	get_tree().call_group(&"playes", &"queue_free")
	
	var player = player_scene.instantiate()
	var player_spawn_location = $Player1Start.position
	player.position = player_spawn_location
	add_child(player)
	player.action.connect(_on_action)
	
	var mob = mob_scene.instantiate()
	var mob_spawn_location = $Enemy1Start.position
	mob.position = mob_spawn_location
	add_child(mob)
	$SpeedTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_action():
	$SpeedTimer.stop()
