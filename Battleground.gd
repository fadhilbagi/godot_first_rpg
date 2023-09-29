extends Node2D
@export var mob_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().call_group(&"mobs", &"queue_free")
	$Player.start($Player1Start.position)
	
	var mob = mob_scene.instantiate()
	var mob_spawn_location = $Enemy1Start.position
	mob.position = mob_spawn_location
	add_child(mob)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
