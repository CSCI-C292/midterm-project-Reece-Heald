extends Tabs

onready var price1 = str2var($RichTextLabel/Control/Panel/PriceLabel.text)
onready var price2 = str2var($RichTextLabel/Control/Panel2/PriceLabel.text)
onready var panel1 = get_node("/root/Main/UserInterface/Shop/TabContainer/Guns/RichTextLabel/Control/Button")
onready var panel2 = get_node("/root/Main/UserInterface/Shop/TabContainer/Guns/RichTextLabel/Control/Button2")
onready var inventory = get_node("/root/Main/UserInterface/Inventory")
onready var inventory_slots = get_tree().get_root().get_node("/root/Main/UserInterface/Inventory/Background/GridContainer")

var slots = preload("res://Slot.gd")

var ItemClass = preload("res://Item.tscn")
var item = null

func _process(delta):
	pass


func _on_Button_pressed():
	buy(price1, 0)
	
func buy(price, item_no):
	
	GameState.load_store()
	if price == 100:
		if GameState.money >= price:
			GameState.money -= price
			GameState.store.bought[item_no] = true
			#GameState.save_store()
			panel1.text = "Bought"
			PlayerInventory.add_item("shotgun", .1, 1000, 5)
			slots.initialize_item("shotgun", .1, 1000, 5)
			inventory.initialize_inventory()
	
			print("-----------------")
			print(PlayerInventory.inventory)
		else:
			var rem = price - GameState.money
			$Remainder/Label.text = 'You need '+str(rem)+' money \nto buy this'
			$Remainder.show()
	if price == 55:
		if GameState.money >= price:
			GameState.money -= price
			GameState.store.bought[item_no] = true
			#GameState.save_store()
			panel2.text = "Bought"
			PlayerInventory.add_item("AKM", .15, 1000, 2)
			slots.initialize_item("AKM", .15, 1000, 2)
			inventory.initialize_inventory()
	
			print("-----------------")
			print(PlayerInventory.inventory)
		else:
			var rem = price - GameState.money
			$Remainder/Label.text = 'You need '+str(rem)+' money \nto buy this'
			$Remainder.show()

func _on_Ok_Button_pressed():
	$Remainder.hide()
	
func _ready():

	GameState.load_store()
	




func _on_Button2_pressed():
	buy(price2, 1)
