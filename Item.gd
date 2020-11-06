extends Node2D


var item_name
var fire_rate
var gun_damage
var bullet_speed

func _ready():
	if randi() % 3 == 0:
		$TextureRect.texture = load("res://FOTD Assets/PNG/Inventory/Tile Items/FN45.png")
	else:
		$TextureRect.texture = load("res://FOTD Assets/PNG/Inventory/Tile Items/AKM.png")

func set_item(nm, fr, bs, gd):
	item_name = nm
	fire_rate = fr
	gun_damage = gd
	bullet_speed = bs
	$TextureRect.texture = load("res://FOTD Assets/PNG/Inventory/Tile Items/" + item_name + ".png")
	
func get_name():
	return item_name
	
func get_fire_rate():
	return fire_rate
	
func get_gun_damage():
	return gun_damage
	
func get_bullet_speed():
	return bullet_speed
