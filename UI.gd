extends Control



onready var healthBar : TextureProgress = get_node("Health_Box/Health_Bar")
onready var moneyText : Label = get_node("Health_Box/Money_Text")

func update_health_bar (curHp, maxHp):
 
	healthBar.value = (100 / maxHp) * curHp

func update_gold_text (money):
 
	moneyText.text = "Money: $" + str(money)
