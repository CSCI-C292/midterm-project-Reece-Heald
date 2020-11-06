extends Node


const num_of_slots = 4

var inventory = {
	0:["FN45", 0.2, 1000, 1] #["name", fire_rate, bullet_speed, gun_damage
	
}



func add_item(item_name, fire_rate, bullet_speed, gun_damage):
	for i in range(num_of_slots):
		if inventory.has(i) == false:
			inventory[i] = [item_name, fire_rate, bullet_speed, gun_damage]
			return

