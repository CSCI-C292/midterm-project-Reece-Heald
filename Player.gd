extends KinematicBody2D

	
onready var ui = get_node("/root/Main/UserInterface/UI")
onready var inventory = get_node("/root/Main/UserInterface/Inventory")
onready var player_texture = get_node("/root/Main/Player/Player_Sprite")
onready var zombie_spawner = get_node("/root/Main/Zombie_Spawner")

export var Bullet: PackedScene 

var _speed := 155
var bullet_speed = 1000
var fire_rate = 0.2
var max_health = 5
var gun_damage = 1
var velocity = Vector2()
var can_fire = true
var curHp = max_health
var curItem = PlayerInventory.inventory.get(0)




#sound
var shootSound = AudioStreamPlayer.new();
var walking = AudioStreamPlayer.new();
var background = AudioStreamPlayer.new();
var hurt = AudioStreamPlayer.new();

func _process(delta):	
	ui.update_gold_text(GameState.get_money())
	if Input.is_action_just_pressed("shooting"):
		var new_bullet = Bullet.instance()
		new_bullet.position = $"Gun Position".global_position
		new_bullet.rotation_degrees = self.rotation_degrees
		new_bullet.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		self.get_parent().add_child(new_bullet)
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true
		
		self.add_child(shootSound);
		shootSound.stream = load("res://FOTD Assets/Sounds/bullet/gunSound.wav");
		shootSound.play(true);
	#curItem = PlayerInventory.inventory.get(0)
	#player_texture.texture = load("res://FOTD Assets/PNG/Player/Player_Weapons/" + curItem[0] + "/" + curItem[0] +".png")

	if GameState.is_player_dead == true:
		AudioServer.set_bus_mute(0,true)
	else:
		AudioServer.set_bus_mute(0,false)
	
func _physics_process(delta):	
	look_at(get_global_mouse_position())
	get_input()
	velocity = move_and_slide(velocity)
	
	
	
	
func get_input():
	
	velocity = Vector2()
	if(Input.is_action_pressed("move_right")):
		velocity.x += _speed

	if(Input.is_action_pressed("move_left")):
		velocity.x -= _speed
	if(Input.is_action_pressed("move_up")):
		velocity.y -= _speed
	if(Input.is_action_pressed("move_down")):
		velocity.y += _speed
		
	velocity = velocity.normalized() * _speed
	
	if(Input.is_action_just_pressed("inventory")):
		inventory.visible = !inventory.visible
		inventory.initialize_inventory()
		
	if Input.is_action_just_pressed("move_right") or Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_up") or Input.is_action_just_pressed("move_down"):
		self.add_child(walking);
		walking.stream = load("res://FOTD Assets/Sounds/Player/walking.wav");
		walking.volume_db = -13
		walking.play(true);
		
func take_damage (dmgToTake):
	self.add_child(hurt);
	hurt.stream = load("res://FOTD Assets/Sounds/Player/hurt.wav");
	hurt.volume_db = -13
	hurt.play(true);
	curHp -= dmgToTake
	ui.update_health_bar(curHp, max_health)
	
	if curHp <= 0:
		die()
		GameState.is_player_dead = true
		hurt.play(false);
		walking.play(false);
		shootSound.play(false);
		
func die ():
	#get_tree().reload_current_scene()
	GameState.is_game_over = true
	
func _ready ():
	GameState.is_player_dead = false
	ui.update_health_bar(curHp, max_health)
	self.add_child(background);
	background.stream = load("res://FOTD Assets/Sounds/Background sounds/background.wav");
	background.volume_db = -10
	background.play(true);
	
func set_fire_rate (amount):
	fire_rate = amount
	
func set_bullet_speed (amount):
	bullet_speed = amount
	
func set_gun_damage (amount):
	gun_damage = amount
