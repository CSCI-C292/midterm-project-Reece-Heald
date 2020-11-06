extends Panel

var ItemClass = preload("res://Item.tscn")
var item = null
var empty_tex = preload("res://FOTD Assets/PNG/Inventory/Tile Items/Empty Slot.png")
var default_tex = preload("res://FOTD Assets/PNG/Inventory/Tile Items/Empty Slot.png")

var empty_style: StyleBoxTexture = null
var default_style: StyleBoxTexture = null



func _ready():
	empty_style = StyleBoxTexture.new()
	empty_style.texture = empty_tex
	default_style = StyleBoxTexture.new()
	default_style.texture = default_tex

	refresh_style()
	
func refresh_style():
	if item == null:
		set('customs_styles/panel', empty_style)
	else:
		set('custome_styles/panel', default_style)
func pickFromSlot():
	remove_child(item)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.add_child(item)
	item = null
	refresh_style()
	
func putIntoSlot(new_item):
	item = new_item
	item.position = Vector2(0, 0)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.remove_child(item)
	add_child(item)
	refresh_style()
	
	
func initialize_item(item_name, fire_rate, bullet_speed,  gun_damage):
	if item == null:
		item = ItemClass.instance()
		add_child(item)
		item.set_item(item_name, fire_rate, bullet_speed,  gun_damage)
	else:
		item.set_item(item_name, fire_rate, bullet_speed,  gun_damage)
	refresh_style()
	
