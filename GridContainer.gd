extends GridContainer

onready var player_texture = get_node("/root/Main/Player/Player_Sprite")
onready var player = get_node("/root/Main/Player")
#var curItem = area.get_parent().get_name()
var player_temp_texture
var curItem_fr_temp 
var curItem_gd_temp
var curItem_bs_temp

func _on_Area2D_area_entered(area):
	
	if area.name == "ItemArea":
		#curItem = PlayerInventory.inventory.get(0)
		var curItem = area.get_parent().get_name()
		curItem_fr_temp = area.get_parent().get_fire_rate()
		curItem_gd_temp = area.get_parent().get_gun_damage()
		curItem_bs_temp = area.get_parent().get_bullet_speed()
		print(curItem)
		player_temp_texture = load("res://FOTD Assets/PNG/Player/Player_Weapons/" + curItem + "/" + curItem +".png")


func _process(delta):
	player_texture.texture = player_temp_texture
	player.set_fire_rate(curItem_fr_temp)
	player.set_gun_damage(curItem_gd_temp)
	player.set_bullet_speed(curItem_bs_temp)
