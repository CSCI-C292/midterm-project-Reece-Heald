extends KinematicBody2D


var curHp : int = 5
var maxHp : int = 5
 
var moveSpeed : int = 100
var xpToGive : int = 30
 
var damage : int = 1
var attackRate : float = .15
var attackDist : int = 60
var chaseDist : int = 400


var hurt = AudioStreamPlayer.new(); 

onready var timer = $Timer
onready var target = get_node("/root/Main/Player")


func _physics_process (delta):
 
	var dist = global_position.distance_to(target.global_position)
	look_at(target.get_position())
	if dist > attackDist:
		var vel = (target.global_position - global_position).normalized()
		move_and_slide(vel * moveSpeed)


func attack():
	if global_position.distance_to(target.global_position) <= attackDist:
		target.take_damage(damage)
		
func _ready ():
	timer.wait_time = attackRate
	timer.start()
	

	
func take_damage (dmgToTake):
	self.add_child(hurt);
	hurt.stream = load("res://FOTD Assets/Sounds/zombie/hurt.wav");
	hurt.volume_db = -13
	hurt.play(true);
	curHp -= dmgToTake
 
	if curHp <= 0:
		die()
 
func die ():
	GameState.increase_score(5)
	queue_free()
	

func bullet_hits(area):
	if area.name == "damage_area":
		take_damage(target.gun_damage)
		
	
