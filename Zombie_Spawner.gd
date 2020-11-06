extends Node2D

export var _enemy_scene: PackedScene
var spawn = AudioStreamPlayer.new();

func spawn_enemy() -> void:
	var postion_x =  $"Zombies_Spawn_Position".position.x
	var postion_y =  $"Zombies_Spawn_Position".position.y
	var new_enemy = _enemy_scene.instance() as Node2D
	self.add_child(new_enemy)
	new_enemy.position = Vector2(postion_x, postion_y)
	self.add_child(spawn);
	spawn.stream = load("res://FOTD Assets/Sounds/zombie/spawn2.wav");
	spawn.volume_db = -13
	if GameState.is_player_dead == false:
		spawn.play(false);
	else:
		spawn.play(true);
	
	#new_enemy.position = Vector2(global_position.x, global_position.y)

